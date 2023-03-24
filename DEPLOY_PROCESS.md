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

## *You must do a version bump for rails 5 (master using 5.x.x) and rails_6 (6.X.X)*
Much can be done with `bundle update nfg_ui --conservative` to avoid bumping every possible gem update in the your gemfile.

## Merging changes into NFG_UI, first:
Merging a feature branch into `master` & `rails_6`:
1. Start by merging the feature branch into `master` (which is rails 5 compatible)
2. Create a new branch *from* `rails_6`, e.g.: `feature/merge_master_into_rails_6`
3. Merge master into rails_6 and deal with any merge conflicts.
  * Pay particular attention to gemfile and gemfile.lock conflicts!
4. Push up the `feature/merge_master_into_rails_6`
5. Create a PR for `feature/merge_master_into_rails_6` to *ensure* only the expected changes are merging in. This is important :)
  * Github will automatically set master as the receiving branch, you will need to change it to `rails_6`
6. Once reviewed on Github, merge in and delete the `feature/merge_master_into_rails_6` branch.

## Deploy to rubygems.org
Really simple: from master branch run `bundle exec rake release`

## Merging into NFG_UI Engines & Apps.

### Engines:
You must go in this order due to dependencies:
1. Merge in `nfg_ui` to `nfg_onboarder`
  * nfg_ui 5.X.X merges into `nfg_onboarder`'s `master` branch
  * nfg_ui 6.X.X merges into `nfg_onboarder`'s `rails_6` branch
2. Then merge in nfg_ui to `nfg_csv_importer`
  * `nfg_csv_importer` depends on `nfg_onboarder`
  * nfg_ui 5.X.X merges into `nfg_csv_importer`'s `master` branch
  * nfg_ui 6.X.X merges into `nfg_csv_importer`'s `rails_6` branch

### Apps:
Go in any order you desire...
(At the time of this writing ... 12/8/22 ... `Givecorps-site` is rails 5, if that changes, `nfg_ui` should then use the `rails_6` branch -- until then, `Givecorps-site` uses nfg_ui `master`)
1. (While rails 5) `Givecorps-site` uses nfg_ui `master`
  * While rails 5, `Givecorps-site` needs the updated `nfg_onboarder` that you merged in before.
2. `donor_management` uses nfg_ui `rails_6`
  * `donor_management` needs updated `nfg_onboarder`
  * `donor_management` needs updated `nfg_csv_importer`
3. `auctions` uses nfg_ui `rails_6`
  * At the time of this writing, `auctions` does not consume the onboarder or the importer. If that changes, it will also need an update.
