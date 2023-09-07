## Releasing New Versions

1. Add `~/.gem/credentials` to enable you to push to NFG's private gem repository:

```yaml
---
:github: Bearer ########################################
```

2. Bump the version number in `lib/nfg_page_actions/version.rb`.

3. Run the following command. When prompted, enter your github username and the token created above.

```bash
rake build
gem push --key github --host https://rubygems.pkg.github.com/network-for-good pkg/nfg_page_actions-#.#.#.gem
```

4. Tag the new version:

```bash
git tag -a v#.#.# -m 'release v#.#.#'
git push --tags
```

5. Create a new release in Github by right clicking on the newly-pushed tag and selecting 'Create release':

```bash
open https://github.com/network-for-good/nfg_page_actions/tags
```

# Deploying NFG_UI Across NFG Apps & Engines
This is a pretty straight forward, though laborious process. It works like this:
1. Make your updates to nfg_ui master branch (include a version bump and make sure `/publisher` is re-bundled after the version bump)
2. Merge them into master and release the change to rubygems.org
3. Merge updates from master into nfg_ui's rails_6 branch (very carefully review the PR for unwanted changes!!!)
4. Merge nfg_ui into the engines (onboarder, THEN importer due to dependencies) which require rails 5 version (master branches) and rails_6 versions (rails_6 branches)
5. Then merge nfg_ui and updated importer and onboarder engines into Givecorops-site, donor_management and auctions.

A more detailed breakdown is below:

## Requirements for merging:
1. You've provided full spec coverage for all changes
2. The version has been bumped up appropriately for nfg_ui and the contained `/publisher` app
3. The changelog includes the version update as well as a summary of updates
4. The [nfg_ui_display_app](https://github.com/network-for-good/nfg_ui_display_app) has an associated PR and all component updates are accurately recorded and reflected in the display app.

## *You must do a version bump*
Much can be done with `bundle update nfg_ui --conservative` to avoid bumping every possible gem update in the your gemfile.

## Deploy to rubygems.org
Really simple: from master branch run `bundle exec rake release`

## Merging into NFG_UI Engines & Apps.

### Engines:
You must go in this order due to dependencies:
1. Merge in `nfg_ui` to `nfg_onboarder`
  * nfg_ui 6.X.X merges into `nfg_onboarder`'s `rails_6` branch
  * nfg_ui 6.X.X merges into `nfg_onboarder`'s `rails_6_1` branch
2. Then merge in nfg_ui to `nfg_csv_importer`
  * `nfg_csv_importer` depends on `nfg_onboarder`
  * nfg_ui 6.X.X merges into `nfg_csv_importer`'s `rails_6` branch
  * nfg_ui 6.X.X merges into `nfg_csv_importer`'s `rails_6_1` branch

### Apps:
Go in any order you desire...
1. `Givecorps-site` uses nfg_ui `master`
  * `Givecorps-site` needs updated `nfg_onboarder`'s `rails_6` branch
  * `Givecorps-site` needs updated `nfg_csv_importer`'s `rails_6` branch
2. `donor_management` uses nfg_ui `master`
  * `donor_management` needs updated `nfg_onboarder`'s `rails_6_1` branch
  * `donor_management` needs updated `nfg_csv_importer`'s `rails_6_1` branch
3. `auctions` uses nfg_ui `master`
  * `auctions` needs updated `nfg_onboarder` 's `rails_6_1` branch
  * `auctions` needs updated `nfg_csv_importer`'s `rails_6_1` branch
