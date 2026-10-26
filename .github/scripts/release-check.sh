#!/usr/bin/env bash
# Decides what a push to main needs: nothing, a publish, or only a missing release tag.
# Sets the step outputs `version` and `publish` ("true" only when a publish is needed).
#
# Required env: GEM_NAME VERSION_FILE VERSION_CONST TAG_PREFIX
# Optional env: GEMSPEC (default <GEM_NAME>.gemspec), GITHUB_TOKEN (registry read access),
#               GITHUB_OUTPUT, RELEASE_SOURCE_URL (override the registry, used by tests),
#               MAX_RECOVERY_CANDIDATES (default 50)
#
# 1. tag v<version> exists                     -> nothing to do
# 2. version is not in the registry            -> publish
# 3. version is in the registry but has no tag -> a previous run published it and then failed
#    to push the tag. Find the commit the package was built from by building the gem at each
#    candidate commit and comparing its files with the published package's; tag the first
#    match, or fail if none matches (never tag a commit we couldn't verify).
# If the registry can't be queried at all we fall back to step 2, i.e. the behaviour before
# this check existed (a real duplicate is then rejected by the registry).
set -euo pipefail

: "${GEM_NAME:?}" "${VERSION_FILE:?}" "${VERSION_CONST:?}" "${TAG_PREFIX:?}"
GEMSPEC="${GEMSPEC:-${GEM_NAME}.gemspec}"
MAX_RECOVERY_CANDIDATES="${MAX_RECOVERY_CANDIDATES:-50}"
SOURCE_URL="${RELEASE_SOURCE_URL:-https://x-access-token:${GITHUB_TOKEN:-}@rubygems.pkg.github.com/network-for-good}"
OUT="${GITHUB_OUTPUT:-/dev/stdout}"

emit() { echo "$1=$2" >> "$OUT"; }

VERSION="$(ruby -r "./${VERSION_FILE%.rb}" -e "puts ${VERSION_CONST}")"
TAG="${TAG_PREFIX}${VERSION}"
emit version "$VERSION"

if git ls-remote --exit-code --tags origin "refs/tags/${TAG}" > /dev/null 2>&1; then
  echo "Tag ${TAG} already exists: version ${VERSION} was already released, nothing to do."
  emit publish false
  exit 0
fi

WORK="$(mktemp -d)"
cleanup() {
  git worktree prune > /dev/null 2>&1 || true
  rm -rf "$WORK"
}
trap cleanup EXIT

# Is this exact version already in the registry? A failed fetch (not found, or no access) is
# treated as "not published" so the normal publish path is never blocked by this check.
mkdir -p "$WORK/published"
if ! (cd "$WORK/published" && gem fetch "$GEM_NAME" --version "$VERSION" --source "$SOURCE_URL" > "$WORK/fetch.log" 2>&1); then
  echo "Version ${VERSION} is not in the registry (or the registry could not be read): publishing."
  emit publish true
  exit 0
fi

echo "::warning::${GEM_NAME} ${VERSION} is already in the registry but ${TAG} is missing (a previous run likely published it and failed to tag). Looking for the source commit."
PUBLISHED_GEM="$WORK/published/${GEM_NAME}-${VERSION}.gem"
gem unpack "$PUBLISHED_GEM" --target "$WORK/published/unpacked" > /dev/null

version_at() { # VERSION literal in the version file at commit $1
  git show "$1:${VERSION_FILE}" 2> /dev/null \
    | sed -nE "s/^[[:space:]]*VERSION[[:space:]]*=[[:space:]]*['\"]([^'\"]+)['\"].*/\1/p" | head -1 || true
}

# Earliest commit (walking main's first-parent history) from which the version has been this value.
SOURCE=""
for sha in $(git rev-list --first-parent HEAD -- "$VERSION_FILE"); do
  if [ "$(version_at "$sha")" = "$VERSION" ]; then SOURCE="$sha"; else break; fi
done
if [ -z "$SOURCE" ]; then
  echo "::error::Could not find the commit that set the version to ${VERSION} in ${VERSION_FILE}. Tag ${TAG} manually after confirming which commit the published package was built from."
  exit 1
fi

# Candidates: that commit and every later first-parent commit, oldest first.
CANDIDATES="$(git rev-parse "$SOURCE"; git rev-list --first-parent --reverse "${SOURCE}..HEAD")"

MATCH=""
TRIED=0
for c in $CANDIDATES; do
  TRIED=$((TRIED + 1))
  [ "$TRIED" -gt "$MAX_RECOVERY_CANDIDATES" ] && break
  rm -rf "$WORK/src" "$WORK/cand"
  mkdir -p "$WORK/cand"
  git worktree add --detach --quiet "$WORK/src" "$c"
  # gem unpack names its output directory after the .gem file, so build it under the real name
  # to get a tree directly comparable with the published package's.
  if (cd "$WORK/src" && gem build "$GEMSPEC" --output "$WORK/cand/${GEM_NAME}-${VERSION}.gem" > /dev/null 2>&1); then
    gem unpack "$WORK/cand/${GEM_NAME}-${VERSION}.gem" --target "$WORK/cand/unpacked" > /dev/null
    if diff -r "$WORK/published/unpacked/${GEM_NAME}-${VERSION}" "$WORK/cand/unpacked/${GEM_NAME}-${VERSION}" > /dev/null 2>&1; then
      MATCH="$c"
    fi
  fi
  git worktree remove --force "$WORK/src" > /dev/null 2>&1 || true
  [ -n "$MATCH" ] && break
done

if [ -z "$MATCH" ]; then
  echo "::error::${GEM_NAME} ${VERSION} is in the registry but no commit from ${SOURCE:0:7} to HEAD builds a package with identical contents, so ${TAG} was NOT created. Tag the correct commit manually (git tag -a ${TAG} <sha> && git push origin ${TAG})."
  exit 1
fi

git config user.name "github-actions[bot]"
git config user.email "github-actions[bot]@users.noreply.github.com"
git tag -a "$TAG" "$MATCH" -m "release ${TAG} (tag recovered by the publish workflow: the published package's contents are identical to a build of ${MATCH})"
git push origin "refs/tags/${TAG}"
echo "::notice::Created missing tag ${TAG} at ${MATCH:0:7} (published package verified identical to a build of that commit). Nothing to publish."
emit publish false
