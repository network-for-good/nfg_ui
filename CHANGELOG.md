# Changelog
## 0.12.0.1
* `0.12.0` was unable to publish CSS assets to s3 due to a problem with ExecJS. This version locks ExecJS into `'~> 2.7.0'` in the gemfile.

## 0.12.0 *UI/DESIGN BREAKING CHANGES*
The summary of improvements are better UI alignment with networkforgood.com launch (colors, type, spacing, etc) and better accessibility (mainly contrast).

* updates grid (and base) spacing from 24px to 32px
* adds a xxl device size breakpoint for largest screens
* updates neutral gray scale to include a slight hue of our primary blue
* improves our text-muted color to be more accessible (higher contrast)
* improves font size and line height of our typography to allow for better vertical rhythm on the 32px scale
* adds focus style to buttons and form elements for better accessibility
* improves contrast on badges for better accessibility
* better aligns main navs in both DM and FP through color
* adds style support to use = ui.nfg :button, :secondary which is the same as = ui.nfg :button, :outlined, :secondary to help with writing syntax in other apps
* changes page header component to use h1 instead of h2
* changes tile header component to use h4 instead of h6

## 0.11.18
* Addresses security vulnerability in /publisher app and bumps `nokogiri` from `1.11.1` to `1.11.5`.

## 0.11.17
* Addresses security vulnerability [GHSA-7rrm-v45f-jp64](https://github.com/advisories/GHSA-7rrm-v45f-jp64) by bumping `nokogiri` from `1.11.3` to `1.11.4`
* Addresses security vulnerability [GHSA-q28m-8xjw-8vr5](https://github.com/advisories/GHSA-q28m-8xjw-8vr5) by bumping `puma` from `<= 4.3.7` to `~> 5.3`

## 0.11.16
* Addresses security vulnerability [CVE-2021-22904](https://github.com/advisories/GHSA-7wjx-3g7j-8584) by bumping `actionpack` from `5.2.4.6` to `5.2.6`

## 0.11.15
* Introduces additional CSS styles needed to power the NFG Livestream Chat feature for giving page templates.

## 0.11.14
* Fixes nfg_ui `Button` icon usage where a button without text (with an icon) would add a spacer class to the icon even when there was no text.

## 0.11.13
* Addresses security vulnerability [CVE-2021-22880](https://github.com/advisories/GHSA-8hc4-xxm3-5ppp) by bumping `activerecord` from `5.2.4.4` to `5.2.4.5`
  * Essentially: bumps `rails` to `5.2.4.5`

## 0.11.12
CSS updates
**Core**
* adds "drawer" styles for top, right, bottom, and left variants (this uses current modal component as a base)
* moves `.modal-cover` styles from admin to core
* adds responsive type styles
* makes text-divider styles accommodate more than `.text-center`
* adds missing border-radius to default progress bar size

**Public**
* adds event livestream template styles
* adds `.page-header` styles to public to replace sticky-div styles and accommodate new event livestream template styles (these are similar to event builder styles)
* makes background white to better clear out NFG styles for customer styles and clears out sticky-div public styles
* cleans up miscellaneous card and text-muted styles

**Admin**
* better image styles for campaign card on admin campaign index in FP

## 0.11.11.1
* Fixes z-index for select2 dropdown menu when hosted within a modal.

## 0.11.11
* Addresses security vulnerability [GHSA-vr8q-g5c7-m54m](https://github.com/advisories/GHSA-vr8q-g5c7-m54m) by bumping `nokogiri` from `1.10.10` to `1.11.0`

## 0.11.10
* Adds `heartbit` and `.notify` css animations and classes to support NFG's DMS notification featurette utilized by sysadmins. This is a CSS only update.

## 0.11.9
* `SlatItem` is now `Tooltipable` and can have tooltips passed in via its options: `ui.nfg(:slat_item, slat_header: 'Test', tooltip: 'The Tooltip')`

## 0.11.8
* CSS style additions for beefree.io editor
  * Added support for Beefree.io editor to render with a height when it is in and out of the builder layout. There's support for when there is and is not the builder-nav (typically used for step navigation in an onboarder).
* Removes listed rogue `muted` trait from `Typeface` traits on `lib/nfg_ui/components/traits/typeface.rb`.

## 0.11.7
* CSS style updates for custom form elements.
  * There was a gap between the checkbox/radio/switch that didn't allow the user to select the option -- resulting in a poor UX where the user would have to click either the icon or the language for it to work.
  * There's also an update to custom-select using color variations on focus, the large dropdown size from Donor Management and more explicit sort styles.

## 0.11.6
* Fixes compatability issue with VW in CSS. Replaces VW with % for the "Builder" layout.

## 0.11.5
* Adds activity feed styles that are in DM, introduces icon-circle and skeleton styles. Skeleton comes with a loading sheen for future loading features.

## 0.11.4
* `Modal` updates:
  * `:title` option is now optional. If left nil / empty, the `ModalHeader` component will not render. This is similar to `Tile`.
  * A new `size` option has been added called `:cover`
    * `:cover` trait is avaialable and is also applied by using the `size` option: `size: :cover`
    * This will set the modal to be a full screen "cover" on the page.

## 0.11.3
* Adds responsive sizing helper classes to CSS (ex: `.w-md-50`)

## 0.11.2
* Updates to Ruby 2.5.8 to match NFG app ruby versions while also necessary to support security vulnerability issues with Rails 5 and `ActionView`.
* Addresses security vulnerability [GHSA-cfjv-5498-mph5](https://github.com/advisories/GHSA-cfjv-5498-mph5) by bumping `actionview` from `5.2.4.3` to `5.2.4.4`
* Upgrades Rails to 5.2.4.4

## 0.11.1.1
* Fixes gemfile for publisher app

## 0.11.1
* Introduces nfg_ui publisher. See `Asset publishing` in README.md for specifics.
* `Avatar` now uses the image path helper for locating assets within the asset pipeline. This was missing before and could only accurately load in external images via a URL.

## 0.11.0 *BREAKING CHANGES*
* Sweeping changes and upgrades to the slats component.
* Note: removal of the `SlatList` will cause your host app to error. You will need to remove the `:slat_list` component from your view. All children `:slat`s should now be siblings of `:slat_header`

HAML Example:
```ruby
= ui.nfg :slats, :lg, :nowrap, slat_actions: :lg do
  = ui.nfg :slat_header do
    = ui.nfg :slat do
      = ui.nfg :slat_body do
        = ui.nfg :slat_item, slat_header: 'First Column'
        = ui.nfg :slat_item, slat_header: 'Second Column'

  = ui.nfg :slat do
    = ui.nfg :slat_body do
      = ui.nfg :slat_item, heading: 'Karl Fergood live here at this column', caption: 'A caption about this contact'
      = ui.nfg :slat_item do
        = ui.nfg :typeface, :truncate, body: 'aReallyLongStringForTruncationExampleIsPlacedHereAndBecauseItsGreatToStressTestItsEvenLonger!'
    = ui.nfg :slat_actions do
      = ui.nfg :slat_action, href: '#', body: 'Edit', icon: 'pencil'
      = ui.nfg :slat_action, :danger, href: '#', body: 'Delete', icon: 'trash-o', method: :delete, confirm: 'Are you sure you want to delete?'
```

* Removed `SlatList` which used to be the direct sibling of `SlatHeader` (embracing the `Slat`s)
* CSS Updates:
  * Overhaul / refactor of CSS for all slat components.
* Ruby updates:
  * `SlatItem` updates:
    * Fix: `:href` option no correctly gets passed to the `:slat_header` instead of being placed on both the `.slat-item` div AND the `slat_header`
    * `SlatItem` now accepts the `:size` option, specifically for use on the first `SlatItem` within a `Slat`
    * Setting `:size` (or using the size trait, such as `:lg`) will now increase the size of that slat item in relation to the other SlatItems.
      * Ex: `size: :lg` will make the SlatItem 3x the width of all other slats.
      * Available size options: `:md, :lg, :xl`
      * By default, `sm` is the default size; `:sm` is ignored and specifically rejected from the `resized?` list since it does not require a `.slat-items-sm` css class to be added.
    * When the `:slat_header` option is applied, the column header will now include the `.slat-column-header` css class.
      * Any `.slat-column-header` that is not inside the `.slat-header` will not display on larger devices, but will display on smaller devices to help identify the data in that specific `:slat_item` column.
  * `SlatActions` update (note: the plural Action*s*):
    * The following `options` have been removed:
      * `:wide` is replaced by utilizing the `:slat_actions` sizing option on the parent `Slats` component.
        * In response, the `SlatActions` auto-built `DropdownToggle` now includes a custom css class `.slat-actions-text` which is influenced by the `slat_actions` sizing that is set on the parent `Slat`
      * `:slat_header` has been removed and is no longer necessary to identify a `slat_actions` as a `slat_header`
  * `Slats` updates (note: the plural Slat*s*):
    * Slats are now `Sizable` and utilize `Size` trait module
    * Example usage: `<%= ui.nfg(:slats, size: :lg, nowrap: true, slat_actions: :lg) %>`
    * New Options:
      * Utilizing a `:size` option or size trait (`:sm, :lg`) will supply a `.slats-XXX` size css class and increase / decrease the amount of space between slats.
      * `:nowrap` by default is `false`, when set to `true` the column structure of children `SlatItem` will remain columnular. When `false` (its default behavior), the columns will break down into rows at responsive widths.
        * Options: `nowrap: true, false`
        * Traited: `:nowrap`
      * `:slat_actions`
        * This option does not often need to be added and its default behavior will work for a majority of situations.
        * Options: `slat_actions: :sm, :lg, :none`
        * traited: `:slat_actions_sm, :slat_actions_lg, :slat_actions_none`
        * This determines whether or not to accomodate a specific `SlatActions` button configuration. *Note:* `nil` is diferent from `:none`
          * `:sm` - account for a small SlatAction (icon only)
          * `:lg` - account for a large SlatAction (Text & Icon)
          * `:none` - Do not account for a SlatAction
          * Leaving `nil` for slat_actions will kick off default behavior for the Slats' SlatAction which is a combination of :lg (for large screen) and :sm for small screen (where the slat action flexes) across screen sizes hiding and showing its text

## 0.10.15.1
* Addresses security vulnerability [CVE-2020-10663](https://github.com/advisories/GHSA-jphg-qwrw-7w9g) by bumping `json` from `2.1.0` to `2.3.1`
* Addresses security vulnerability [CVE-2020-8184](https://github.com/advisories/GHSA-j6w9-fv6q-3q52) by bumping `rack` from `2.2.2` to `2.2.3`

## 0.10.15
* Consolidates admin and public styles into new core directory for wider company usage
* Moves entity branding styles to core directory
* Moves legacy browser support styles to core directory

## 0.10.14
* Adds responsive embed variables that were available in the admin suite to the public suite (so 4by3 and 3by4 are avaialble, for example).
* adds :not() pseudo-class to links in alerts to prevent buttons being the same color as their background

## 0.10.13
* Addresses security vulnerability [CVE-2020-8165](https://github.com/advisories/GHSA-2p68-f74v-9wc6) by bumping `activesupport` from `5.2.4.2` to `5.2.4.3`
* Addresses security vulnerability [CVE-2020-8164](https://github.com/advisories/GHSA-8727-m6gj-mc37) by bumping `actionpack` from `5.2.4.2` to `5.2.4.3`
* Addresses security vulnerability [CVE-2020-8162](https://github.com/advisories/GHSA-m42x-37p3-fv5w) by bumping `activestorage` from `5.2.4.2` to `5.2.4.3`

## 0.10.12
* Addresses security vulnerability [GHSA-w64w-qqph-5gxm](https://github.com/advisories/GHSA-w64w-qqph-5gxm) by bumping `puma` to `4.3.5`

## 0.10.11
* Adds modernizr JS assets from Network For Good's Fundraising Pages application so that the fallback CSS (`app/assets/stylesheets/nfg_ui/network_for_good/public/legacy_browser_support`) will accurately be run when legacy browsers are detected.
* Legacy browser support has been added, by default, to `nfg_ui/application`
* If you are not requiring `nfg_ui/application` in your application.js, Modernizr JS assets need to be included in your application.js file manually: `//= require nfg_ui/vendor/legacy_browser_support/application`

## 0.10.10
* Adds Donor Management color variation styles
* Updates builder layout styles to be more flexible and work in onboarders
* Adds height: 100%; to html element in admin and public views

## 0.10.9
* Adds file input javascript that supplies the filename to custom file input form controls.

## 0.10.8.2
* Addresses security vulnerability [GHSA-65cv-r6x7-79hv](https://github.com/advisories/GHSA-65cv-r6x7-79hv) by bumping `actionview` from `5.2.2` to `5.2.4.2`

## 0.10.8.1
* Addresses security vulnerability [CVE-2020-8130](https://github.com/advisories/GHSA-jppv-gw3r-w3q8) by bumping `rake` from `12.3.2` to `13.0.1`

## 0.10.7
* Updates `NfgUi::Bootstrap::Components::Base` `#href` method to leverage `view_context`'s `#url_for` so that ActiveRecord objects and hashes can be passed into the `href` option.
  * Example: `= ui.nfg :button, href: @admin` now generates the path to the admin show page, e.g.: `admins/7`
  * `= ui.nfg :button, href: { controller: 'admin', action: 'show', id: 7 }` will generate the same `admins/7` URL.
* Updates `#href` method on `Button`, `PageItem`, `NavLink`, `NavbarBrand`, `PageItem`, `DropdownItem` and `IntegratedSlatAction` to leverage `super` instead of fetching `href` from options so that `url_for` is now in use when a fallback isn't set.

## 0.10.6
* CSS Updates
  * Adds Donor Management container styles to support pre-NFG_UI styles
  * Adds product icon styles and font family (icomoon)
  * Adds default alert link (<a>) styles
* `NfgUi::Components::Patterns:PageHeader` upgrades:
  * `PageHeader` now accepts the `:full_width` option (boolean). By default, `:full_width` is set to `false`. This ensures that historic use is unimpacted.
  * Setting `:full_width` to `true` set the wrapping container's column class to a singular `.col` instead of the modifier `col-xl-11 mx-auto`
* `NfgUi::Components::Elements:NavLink` upgrades:
  * `NavLink` is now `Modalable`, supplying the `:modal` option will now successfully target and launch its corresponding modal.
  * `NavLink` can now also `CollapseToggleable` meaning that, *when not a dropdown*, it can power a `Collapse` component (for example: clicking a nav link to expand a collapsed sub navigation, which is decidedly _not_ a dropdown menu)
* `NfgUi::Components::Traits::Icon` `#tip_trait` method was further upgraded to correctly respond to and _not_ modify the component's right/left presence when `:right` is present in options. This was causing problems with certain complex implementations of the tip icon when used in components like a dropdown-powered `NavItem`. Basically: setting `right: false` will now accurately turn off the icon's `:right` behavior.
* `NfgUi::Components::Utilities::ResourceThemeable` now includes two constants:
  * `FALLBACK_ICON` which is set to `heart-o` which is helpful for accessing this icon without guessing in specs and other areas of the app.
  * `DEFAULT_THEME_COLOR` for `resource_theme_color` is set to `primary` for similar easy access for specs and other uses.

## 0.10.5
* Updates ruby version to 2.3.8 to be in sync with Network For Good's All in One software.
* Updates JavaScript initializers and plugins to work in both turbolinks and non-turbolinks environments.


## 0.10.4.1
_Jan. 13, 2020_
* Updates select2 list items to break onto multiple lines.

## 0.10.4
_Dec. 19, 2019_
* Adds Network for Good's "builder" UI to the shared CSS library.
* Adds intercom.io styling to admin stylesheet manifest.

## 0.10.3
_Dec. 19, 2019_
* Addresses security vulnerability [GHSA-hrqr-hxpp-chr3](https://github.com/advisories/GHSA-hrqr-hxpp-chr3) by bumping `rack` from `2.0.7` to `2.0.8`

## 0.10.2
_Dec. 17, 2019_
* Addresses safari page-jumping when interacting with select2 by setting a more specific parent. Tracks to: [Jira PSTWO-14309](https://jira.networkforgood.org/browse/PSTWO-14309)

## 0.10.1
_Dec. 12, 2019_
* Adds missing `require 'browser'` to nfg_ui.rb so that host apps have access to `browser` method on load.

## 0.10
_Dec. 12, 2019_
* *POTENTIAL BREAKING CHANGES*
* Upgrades Browser gem to 2.7.1
  * Supplies browser/aliases so that legacy implementation of browser (e.g.: `browser.mobile?`) on the view continue to work.
  * Browser now has a new arg structure where the first arg in `browser` method is the UA as a string. This change may cause issues for existing specs (where browser is stubbed)

## 0.9.28
_Dec. 12, 2019_
* Addresses security vulnerability [CVE-2019-15587
](https://github.com/advisories/GHSA-c3gv-9cxf-6f57) by bumping `loofah` from `2.2.3` to `2.3.1`

## 0.9.27
_Dec. 12, 2019_
* Addresses security vulnerability [GHSA-7xx3-m584-x994](https://github.com/advisories/GHSA-7xx3-m584-x994) by updating `puma` requirement from `~> 3.12` to `~> 4.3`

## 0.9.26
_Dec. 6, 2019_
* `NfgUi::Components::Utilities::ResourceThemeable` received an upgrade with a full accounting of resource theme icons.
  * `NfgUi::Components::Patterns::PageHeader` now has an autolookup for icons and can also receive an `:icon` option, example: `icon: 'bars'`
    * `PageHeader` received numerous upgrades, including a spacing fix for when the subtitle is present.

## 0.9.25.1
_Dec. 3, 2019_
* `NfgUi::Components::Elements::Alert` `:tip` trait now sets `dismissable: false` correctly in the trait.

## 0.9.25
_Nov. 22, 2019_
* Introduces the ability for traits to avoid overwriting pre-existing (manually set) component options. This is an optional implementation made available.
* New trait utility added: `NfgUi::Components::Utilities::Traits::TraitUtilities`
  * Provides a new method: `maybe_update_option(option_key, value:)`
      * This method checks the component's :options hash for a pre-existing value (e.g.: `theme: :danger`) for that :options key
      * If a value is detected for that :options key, it will not overwrite it.
      * If no value is detected, it updates that options value
* The following trait modules were updated:
  * `NfgUi::Components::Traits::Alert`
  * `NfgUi::Components::Traits::Icon`
  * `NfgUi::Components::Traits::Navbar`

## 0.9.24.3
_Nov. 6, 2019_
* Removes `vendor/assets/javascripts` and moves the `bootstrap-datetimepicker.min.js` file into `app/assets/javascripts/nfg_ui/vendor/`
  * In effect, undoes `0.9.24.1`. After further testing, it did not reliably work for the host *engine*.

## 0.9.24.2
_Nov. 6, 2019_
* Addresses security vulnerability [CVE-2019-16892](https://nvd.nist.gov/vuln/detail/CVE-2019-16892) by manually updating `selenium-webdriver`
* Replaces `chromedriver-helper` development dependency with `webdrivers`

## 0.9.24.1
_Nov. 6, 2019_
* Adds `vendors/assets/javascripts` to the `Engine`s `config.autoload_paths`. This resolves an issue where files in the `vendors` folder were not accessible to *host engines*.

## 0.9.24
_Nov. 6, 2019_
* `Modal` now accepts the `:class` option and will apply the class to the parent `.modal` element.

## 0.9.23
_Nov. 1, 2019_
* *NFG_UI* `:tip` `Icon`s have updated options.
  * `:tip` icons now have `right: true` by default when `:text` is present.
  * `:tip` icons use the `.fa-fw` css class for spacing when `:text` is present.

## 0.9.22
_Oct. 25, 2019_
* *NFG_UI* introduces device previews. These are in-line HTML device previews for embedded iframes for previewing a website (like a campaign page). See http://localhost:3000/elements/embeds for examples.

## 0.9.21
_Oct. 22, 2019_
* *NFG_UI:* Responsive tables can now have their scroll message optionally turned off by passing in `caption: nil` to the `:table`'s options.
  * Example: `<%= ui.nfg :table, :responsive, caption: nil ...`
  * You can add a custom caption by supply a caption in the `:options` hash, example: `caption: 'My custom caption'`
  * Browse to `http://localhost:3000/elements/tables` to see them


## 0.9.20
_Oct. 17, 2019_
* Bootstrap and NFG modals are now sizable. See `https://getbootstrap.com/docs/4.3/components/modal/#optional-sizes`
  * Traits: add `:sm` `:lg` or `:xl` to nfg modals.
  * Bootstrap: add `size: :sm` `size: :lg` or `size: :xl`.

## 0.9.19.1
_Oct. 11, 2019_
* Updates CSS styles for public facing tabs and donor specific UI features for the Evo donor profile.

## 0.9.19
_Oct. 2, 2019_
* `NfgUi::Components::Elements::Avatar` is now available as a new component to use. Browse to `http://localhost:3000/elements/avatars` to see them in action
  * Avatars are:
    * Tooltippable `tooltip: 'test tooltip'`
    * Sizable: *Defaults to* `:md` : `<%= ui.nfg :avatar, :xl ... %>`
    * Linkable: `href: '/my/page'`
    * Imageable: `image: '/path/to/image.jpg'`
    * Body: `body: 'JR'`
    * Alt's can be supplied for images: `alt: 'image alt'`
  * Example usage: `<%= ui.nfg :avatar, :xl, image: 'https://i.pravatar.cc/300', href: '#test', alt: 'Test alt', tooltip: 'Test Tooltip' %>`
* `NfgUi::Components::Traits::Size` now accepts all 4 sizes, `:sm`, `:md`, `:lg`, `:xl`
  * `#resize?` method found on the Sizable module will still only supply a resize css class for `:sm` and `:lg`, you must manually override `#resize?` in your target component. For example:
  ```ruby
  def resized?
    [:sm, :md, :lg, :xl].include?(size)
  end
  ```


## 0.9.18.3
_Sep. 19, 2019_
* `NfgUi::Components::Patterns::Carousel` now adds `.pb-3` padding css class to the `.carousel-inner` div *only* when `:indicators` is more than `0`. This removes unexpected padding at the bottom of the `.carousel-inner` when indicators are not present

## 0.9.18.2
_Sep. 12, 2019_
* Fixes CSS bug where the Evo admin DatePicker `.ui-datepicker` div's z-index was below the bootstrap modal's z-index value (thus hiding the calendar widget when within a modal).

## 0.9.18.1
_Sep. 10, 2019_
* *Design System*: Establishes a centralized constant `DEFAULT_TIP_ICON` and `DEFAULT_TIP_THEME` for permeating tip styles and icons across other components. For example, `NfgUi::Components::Elements::Alert` has the `:tip` trait which applies the default tip icon and default tip theme to the alert.

## 0.9.18
_Sep. 9, 2019_
* *Design System*: Adds `:tip` trait to the `NfgUi::Components::Foundations::Icon` which now auto-generates the design-system standard tootlip icon to be used whenever a tip/hint is provided on NFG apps. As of `0.9.18` the `:tip` trait is a `question-circle-o` icon.
  * Example usage: `<%= ui.nfg :icon, :tip, tooltip: 'The tip!' %>`

## 0.9.17
_Sep. 4, 2019_
* Addresses security vulnerability with `Nokogiri` which must now be `1.10.4` or greater [CVE-2019-5477](https://nvd.nist.gov/vuln/detail/CVE-2019-5477)
* `NfgUi::Bootstrap::Components::ButtonGroup`
  * *Vertical Button Group*: Now properly applies either `btn-group` or `btn-group-vertical` when `vertical: true` in the component's `options` instead adding both css classes to the component when vertical.
  * `aria` HTML attributes are no longer inadvertantly overwritten by default. Thus you can now add an aria to a button group, ex: `<%= ui.nfg :button_group, :vertical, aria: { 'test' => 'test2' }... %>`
* CSS Updates:
  * *Datetimepicker:* Updates datetimepicker styles to override the `readonly` `.form-control` styles
  * *NFG_UI:* vertical button group is now designed and styled for usage within NFG apps.

## 0.9.16
_Aug. 27, 2019_
* Introduces [DateTimePicker](https://github.com/xdan/datetimepicker) as the alternative datetimepicker. Demo page: [localhost:3000/javascript_plugins/datetimepicker](http://localhost:3000/javascript_plugins/datetimepicker)
  * The datetimepicker comes in 3 flavors: combo date & time picker, date picker, and time picker. To initialize them, add the `data-datetimepicker` attribute to your text input:
    * DateTime Combo: `%input{ type: 'text', data: { datetimepicker: 'datetime'  } }`
    * Calendar / Date: `%input{ type: 'text', data: { datetimepicker: 'date' } }`
    * Time: `%input{ type: 'text', data: { datetimepicker: 'time' } }`

## 0.9.15
_Aug. 1, 2019_
* Re-introduces the official `Table` component.
  * _Design System Version_: [Table Element](http://localhost:3000/elements/tables)
  * See Bootstrap docs for [Tables](https://getbootstrap.com/docs/4.3/content/tables/) for a rundown of the options available.
  * _Tables options:_
  * `:responsive` - `true` wraps the table in a `.table-responsive` classed div.
  * `:striped` - `true` adds the `.table-striped` css class to the `<table>` element.
  * `:bordered` - `true` adds the `.table-bordered` css class to the `<table>` element.
  * `:size` - Setting `:sm` for size, will add the `.table-sm` css class to the table element. _Note:_ setting `:lg` will raise an `ArgumentError` - tables are only "no size" or "small" per docs.
* Introduces a new `NfgUi::Bootstrap::Utilities::Responsiveable` `Utility` module which now manages the `:responsive` option.
  * `Image` & `Illustration` now use the `Responsive` module.
  * Removed `Illustration` trait module and replaced with `Responsiveable`.
* View specs are being retired now that we no longer utilize the `render partial` approach (outside of email); these specs have been moved over to `describe '#render'` ruby class specs.
* CSS:
  * improves UI for textarea min-height
  * Updates the YIQ color contrast threshold to `177` from `147`
  * Fixes custom select form control invalid appearance.
  * Improvements to table CSS aesthetics.

## 0.9.14
_Jul. 12, 2019_
* Fixes issue identified after 0.9.13: "warning: already initialized constant for TRAITS instance". [See issue here](https://github.com/network-for-good/nfg_ui/issues/28).

## 0.9.13
_Jul. 9, 2019_
* Addresses a *critical issue* where `ActionView` was throwing an uninitialized constant error: `ActionView::Template::Error: uninitialized constant NfgUi::UI` when `nfg_ui` is a dependency within another engine.

## 0.9.12
_Jul. 3, 2019_
* `NfgUi::Components::Elements::StepIndicator` becomes an `<a>` tag when `:href` is present in `:options` and becomes a `<span>` when `:href` is not present.
  * `StepIndicator` is now `Wrappable` and can have it's `:as` value changed in `:options`
  * `StepIndicator` no longer renders an empty `Typeface` component when `:body` is empty in `:options`.

## 0.9.11
_Jul. 1, 2019_
* Adds an inky / Zurb Foundation for Emails `callout` component (which we label as 'alert').
  * Render with a `theme` local variable and an optional `body` local or block.
  * Example usage: `<%= render layout: 'nfg_ui/email/alert', locals: { theme_color: :warning, body: 'Email Body' } %>`
* `NfgUi::Components::Elements::Step` now views :active state as a transitory state. Active steps are now seen as `:visited` steps that are also `:active`.
  * As such, an `:active` step will include both the `.active` and `.visited` css classes.
  * CSS has been updated to account for this and no changes should be needed for steps front-end implementation or use as of *0.9.11*
* Formally introduces the `NfgUi::Components::Foundations::Image` component
  * Images are tooltippable (`tooltip: 'My tooltip'`)
  * Images accept `:image` option for the path to the image.
  * Images accept `:src` which is essentially an alias for `:image` (we prefer `:image` since the `Image` component is used throughout the gem and `image: '...'` as an option for other components is more friendly than `src: '...'`)
  * Utilizes a `:responsive` option which is turned on by default.
    * Turning `:responsive` off (`responsive: false`) removes the `.img-fluid` css class.
* Introduced the *illustration* component to the `NetworkForGood` system: `NfgUi::Components::Foundations::Illustration` -- this component inherits `NfgUi::Components::Foundations::Image`
  * Illustrations are tooltippable (`tooltip: 'My tooltip'`)
  * Utilizes sizing options (`size: :lg`) and traits (`ui.nfg :illustration, :lg ...`)
  * `:image` option is available for passing in the path to the image. The gem automatically applies the `image_path()` asset pipeline helper method for the image. You're good to go.
  * By default, since sizing is in use, the `:responsive` option is automatically set to `false`, this can be turned on as needed. *Do not pass in a :size option / trait if `responsive: true`*
  * Example usage:
    * `= ui.nfg :illustration, image: 'test_app/sample_illustration.png'`
    * `= ui.nfg :illustration, :lg, image: 'test_app/sample_illustration.png'`
    * `= ui.nfg :illustration, :sm, image: 'test_app/sample_illustration.png'`
    * As an option: `= ui.nfg :illustration, image: 'test_app/sample_illustration.png', responsive: true`
    * As a trait: `= ui.nfg :illustration, :responsive, image: 'test_app/sample_illustration.png'`

## 0.9.10
_Jun. 12, 2019_
* `NfgUi::Components::Foundations::Icon` now applies `aria-hidden='true'` by default when rendered to improve accessibility per Font Awesome documentation:
  * https://fontawesome.com/how-to-use/on-the-web/other-topics/accessibility
* Fixes an issue where slat actions (and other components, assumedly) were rendering two spacer css classes (ex: `NfgUi::Components::Foundations::Icon::LEFT_ICON_SPACER_CSS_CLASS`) when an icon was present (ex: `<i class="fa fa-heart ml-1 ml-1"></i> Text Example`)
* Further solidifies css class updates on the `Icon` when determining whether or not to apply spacer classes.
* Adds additional specs for `Icon` and thoroughly tests its `#render` method along with many contexts and edge cases that have caused issue or raised issues in the past.
* Adds a helpful `rescue` when using the `#substring_present?` helper method on specs communicating what the method interpretted instead of raising a useless `nil` regex match missing error.
* CSS improvements for event page jumbotron to behave like edgp on mobile

## 0.9.9
_Jun. 5, 2019_
* `NfgUi::Components::Patterns::SlatActions` can now accept the `:button` option. Setting `:button` to `true` (*and* `menu: false`) will result in the `SlatActions` component automatically rendering a button in place of the dropdown menu. Setting `button: false` (*and* `menu: false`) in the component options will render the component as a text link.
  * Example usage: `= ui.nfg :slat_actions, icon: 'trash', body: 'Delete', menu: false, button: true, method: :delete`
* A patching system has been introduced for the design system (not `bootstrap`).
  * Patching a component will now signal that we are introducing functionality that we intend to remove. It also provides a pattern for implementing "quick fixes" and provides a single module suite to review for code debt.
* Along with the patching concept, a new pattern for "quick built" components is now available. This allows us to remove "pass through" methods from the parent component's class and keep it in its own isolated area.
  * For now, this lives in the `lib/nfg_ui/components/utilities/patches/` folder, but will eventually be moved out of patches when further adopted for _other_ components since this particular implementation for `SlatActions` is a signal of code debt.
  * The module name will use a naming convention as such:
    * `Integrated` indicating it is integrated in some way into the component's rendering.
    * `SpiritualChildComponent` class name (ex: `SlatAction`)
    * The actual component implemented is not necessarily important. In the `IntegratedSlatAction` module, we actually leverage both a text link and a `Button` component. Neither of which calls the actual SlatAction component. While this may change later depending how we handle the evolution of our most complex component suite... *slats. The most important point is to signal* what this sub component is being integrated *_as_* Thus, The `IntegratedSlatAction` is communicated as a "slat action" integrated into this component. Nifty.
* CSS improvements introduced for `SlatItem` fixing a spacing bug for small slat items.

## <= 0.9.8.18
* Not documented

