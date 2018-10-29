# Network for Good's Design System for Ruby on Rails
The authoritative resource for the Network for Good front-end UI, empowered by the NFG Design System.

```ruby
gem 'nfg_ui', git: 'https://github.com/network-for-good/nfg_ui'
```

NFG UX & UI team_ (J&K) are excited to bring you... the *Network For Good design system* gem or: `nfg_ui` gem. This bad boy is an all encompassing one-stop shop for everything front-end for Network for Good products.

This gem is an organic, evolving and ongoing work that is the loving result of 4+ years of study, practice, implementation, planning, drafting and good ol' sweat. After a dozen code drafts, a fully realized Sketch design system suite, and the canvas to work on... we're building a robust design system framework.

With this gem, you can stand up a brand new rails app and it will seamlessly, from day 1, look, feel and be a Network for Good product. *Huzzah*

## Accessing Component Code Examples & Documentation:
To review the documentation for the components, get code samples and browse the library, follow the instructions at the bottom for getting the gem setup locally. It has its own `test_app` so the documentation is hosted there and the gem doesn't need to be added to a seperate parent app (unless you want to). We intend to get this online in its own dedicated space... until then, that's your best bet for browsing docs.

## Configuration

### Include the gem in your Gemfile
```ruby
gem 'nfg_ui', git: 'https://github.com/network-for-good/nfg_ui'
```

### Import & Require the gem's assets
_NOTE:_ This gem has not taken over ownership of CSS & JS from Evo yet. Some styles have been brought over for documentation visual check purposes (the core styling is in place), but it's not fully brought over yet. This includes javascript plugins, etc.

Here are the instructions placeholder: 

In `application.scss` add your pertinent stylesheet suite based on whatever context you're building an interface. These are currently two categories: `admin` and `public`


#### SCSS
*Admin* stylesheets should be `@imported` in your pertinent application.scss file:
```scss
@import 'nfg_ui/network_for_good/admin/application';
```

*Public* stylesheets should be `@imported` in your pertinent application.scss file:
```scss
@import 'nfg_ui/network_for_good/public/application';
```

#### Javascript
Currently, there is only one javascript library. This will likely change, but the current setup is as follows: 

Javascript should be `//= required` in your pertinent application.js file:
```js
//= require nfg_ui/application
```

# Usage

## Network for Good design system components

This gem allows you to add any NFG design component to your haml view at command. You can build one line, all inclusive components and build out high level pre-designed and pre-configured context-specific components.

Components also come with traits. Traits are stackable and overwriteable. Traits are meaningful symbols added as the first array of arguments on your component. Read more about traits below. The key value of traits: it provides pre-set and pre-designed components out of the box so that you don't need to go through the monotonous task of adding theme colors, sizes, headlines, etc every time you need to use that component. *Handy*

All components accept the same attributes when appropriate. This list will expand but here is a sample:

* All html attributes (`id`, `data`, `aria`, `required`, if it's an attribute, it's available)
* `body: 'Inserted content into the obvious content space for the component'`
* `title: 'For modals and tiles'`
* `headline: 'For components with headlines like media objects'`
* `:collapsible` and `:collapsed`
* more to come...
* `tooltip: 'My tooltip text'` is available on many components (that would make sense to have tooltips) and will automatically apply a tooltip to the component


Examples:
```haml
// Produce a styled, pre-designed submit button for your form on the fly
= ui.nfg :button, :submit

// Is the traited / predesigned equivalent of...
= ui.nfg :button, as: :button, type: 'submit', icon: 'chevron-right', body: 'Save & Exit', theme: :primary, disable_with: "<i class='fa fa-spinner fa-spin mr-1'></i> Saving..." 

// Build your own button
= ui.nfg :button, :danger, data: { describe: 'delete-button' } do
  = ui.nfg :icon, 'trash', class: 'mr-1', text: 'Delete Row'
```

#### Trait details
Traits are designed to allow you to speedily build components, or pre-design complex components using meaningful symbols.

Traits are pre-designed / pre-created in the gem (the process / system for this is getting an update after some very cool conversations recently, but the implementation on the front end likely won't be changing)

We use two general "kinds" of traits (this is being examined in more detail, but the usage is the same).

The first "kind" of trait is "speedy" versions of options. The second "kind" of trait are more like a combination of options.

We do this, for example, with an error alert, which then pre-supplies a set of options...

```haml
= ui.nfg :alert, :error

// is the pre-designed error alert that looks like this:
= ui.nfg :alert, :dismissible, theme: :danger, heading: 'Oops!', body: 'There appears to be someting wrong with your submission! Please take a look...'
```

The second kind of trait is the speedy version (described above).

Here are some implementation examples of speedy traits:
* For components that are "themeable" (alerts, buttons, etc) and are designated as such, automatically get a theme trait:
  * `ui.nfg :button, :primary` is a speedy way to write `ui.nfg :button, theme: :primary`
  * `:primary`
  * `:secondary`
  * `:success`
  * `:danger`
  * `:warning`
  * `:info`
  * `:light`
  * `:dark`
* For components that are resizable (buttons, modals, etc)
  * `ui.nfg :button, :large` is the same as `ui.nfg :button, size: :large`
  * `:lg`
  * `:large`
  * `:sm`
  * `:small`
* For components that are collapsible (Tiles for example)
  * `ui.nfg :tile, :collapsible` is the same as `ui.nfg :tile, collapsed: false` 
  * `ui.nfg :tile, :collapsed` is the same as `ui.nfg :tile, collapsed: true`
  * `:collapsible`
  * `:collapsed`
* And more... to be documented

More soon...

### NFG Components
Syntax: `= ui.nfg :component_name, optional_traits, options`

Components are organized into 4 major groupings. Currently 3 of the groupings are available through this gem.

#### Foundations
The basic essentials that form elements
* `:color`
* `:icon`
* `:image`
* `:input`
* `:grid`
* `:typeface`

#### Elements
The main component blocks, made up of foundation components.

* `:activity`
* `:alert`
* `:badge`
* `:breadcrumb`
* `:breadcrumb_item`
* `:button`
* `:chart`
* `:dropdown`
* `:form_control`
* `:input_group`
* `:key`
* `:list_group_item`
* `:loader`
* `:media_object`
* `:nav`
* `:popover`
* `:progress_bar`
* `:slat`
* `:stat`
* `:table`
* `:task`
* `:tooltip`

#### Patterns
Groupings of elements to create rich interfaces. For example, an `:activity_feed` (one of the patterns) is made up many `:activity`

* `:activity_feed`
* `:button_group`
* `:card`
* `:carousel`
* `:empty_state`
* `:filter_bar`
* `:form_group`
* `:graph`
* `:jumbotron`
* `:list_group`
* `:media`
* `:modal`
* `:navbar`
* `:slat_list`
* `:task_list`
* *Tiles*
  * `:tile`
  * `:tile_body`
  * `:tile_header`
  * `:tile_section`

### Component traits for design system components
*Coming soon*

## Bootstrap design system components

Utilize all bootstrap4 components, coded to strict bootstrap standards via a similar method: `= ui.bootstrap :my_component, options...`

*Note: while the names of bootstrap components and network for good components may be similar or identical (ex.: the design system has an `:alert` as does bootstrap), do not use bootstrap components on the front-end. _Only use `ui.nfg` components for front-end code._ Great care has been taken to ensure that any component you'd expect to have from bootstrap4 is made available by an appropriately coded and designed design system component*

The bootstrap side of this will eventually be isolated into its own gem. Until then, it lives within the `nfg_ui` gem.

```haml
// An example alert
= ui.nfg :alert, theme: :danger, dismissible: false, headline: 'Oh snap!', body: 'The alert body content'

// Build your own button
= ui.bootstrap :button, theme: :danger, data: { describe: 'delete-button' } do
  = fa_icon 'trash', class: 'mr-1', text: 'Delete Row'
```

#### Bootstrap components
Syntax: `= ui.bootstrap :component_name, options`

* `:alert`
* `:badge`
* `:breadcrumb`
* `:breadcrumb_item`
* `:button`
* `:button_group`
* `:card`
* `:carousel`
* `:dropdown`
* `:form`
* `:input_group`
* `:jumbotron`
* `:list_group`
* `:list_group_item`
* `:media_object`
* `:modal`
* `:nav`
* `:navbar`
* `:pagination`
* `:popover`
* `:progress`
* `:table`
* `:tooltip`

## Local development & accessing documentation

1. Clone repo:

```
$ git clone https://github.com/network-for-good/nfg_ui.git
```

2. Bundle gems

```
$ bundle exec bundle install
```

All done!

## To browse the components:
Browse the components at: *http://localhost:3000/*

_From the gem's root directory (not spec/test_app/):_, 
Begin rails server the normal way.

```
$ rails s
```

If you're running other rails apps on port 3000 or 3001 you can run this on another port, for example:

```
$ rails s -p 3003
```

Documentation .haml files can be found here:
```
/spec/test_app/app/views 
```
Within that folder are all of the component code examples found when you click through the navigation. Divided up as `Bootstrap`, then the grouping names: `patterns`, `elements`, `foundations`. 

## Specs
_From the gem's root directory (not spec/test_app/):_
This gem comes with spring, you can use spring when executing rspec

```
$ spring rspec
```

## To do's:
1. Create a generator for adding a new bootstrap component and a new nfg component. perhaps run through a script (or skip) to set it up to have utilities in place... do you want it to be... 
```
$ Collapsible? (Y/n): 
```

2. Write out a step by step process for manually creating a component of different nesting levels

3. Trait documentation

4. RDoc

5. Userful error library, particularly on any quirky things (also note quirky things as code-smell stuff to fix.).

6. Look into setting up an installer for allowing configuration options (specifically, initially on whether or not to include simple_form)

7. Host test_app on heroku for online documentation

8. Migrate test_app content into the design system CMS app.

9. Design token integration

10. API feed for design token for third party sites like wordpress?

11. Add I18n lookup.

12. Update browser gem in all NFG apps to 2.5+

13. Review what's involved in having simple_form "subscribe" to our design system inputs and form controls, particularly the advanced ones (like radio buttons with images) so that the design system is actually hosting the html and not obnoxiously complicated simple_form classes doing that job.

14. Design tokens

15. need a better way to define and create / map traits. I am not enjoying the bloat in attr_readers...

16. Generator for customizable components with commented out class methods (like devise's generated controllers) for easy customization (reference that kicked this off was the modal title ... allowing an icon on the bs version might be what you want to do if you're a gem consumer...)

17. Consider implementing a universal catch all "content" attribute when there's only one region so that users don't need to guess if a something like the dropdown header uses `heading` or `body` or `content` for passing in the content.

18. Create a registered list ... for things like tooltippable nfg components (all? some?) -- that way can mass add modules for nfg side as needed.

19. Look into collapsible toggle / collapse toggle, There are lots of buttons that have their classes removed so they can behave as a "link" 

20. Trait specs

21. Consider moving component_css_class out of private so it can be manipulated in the component (instead of needing stuff like remove_component_css_classes methods)

22. Author useful error notifications for missing traits (instead of 'something_trait' method error)

23. need an overlay_blocker

24. should form-row be a (nfg?) component? see: Givecorps-site/app/views/bootstrap4/addresses/_address_form.html.haml

25. card sub title and card title components?

26. consider typeface for link_to so we can supply our luxuries to link_to.

Component tooltip/icon auto list for backup
FOUNDATION_COMPONENT_NAMES = %i[color
                                  icon
                                  image
                                  input
                                  grid
                                  typeface].freeze

  ELEMENT_COMPONENT_NAMES    = %i[activity
                                  alert [icon, tooltip]
                                  badge [icon, tooltip]
                                  breadcrumb
                                  breadcrumb_item [icon, tooltip]
                                  button [icon, tooltip]
                                  chart
                                  dropdown_divider
                                  dropdown_header [icon, tooltip]
                                  dropdown_item [icon, tooltip]
                                  dropdown_toggle [icon, tooltip]
                                  embed
                                  form_control [icon, tooltip]
                                  input_group [icon, tooltip]
                                  key
                                  list_group_item [icon, tooltip]
                                  loader [icon]
                                  media_body [icon, tooltip]
                                  media_object [icon, tooltip]
                                  modal_body [icon, tooltip]
                                  modal_footer
                                  modal_header [icon]
                                  nav
                                  nav_item [icon, tooltip]
                                  nav_link
                                  navbar_brand [icon]
                                  navbar_text
                                  navbar_toggler [icon]
                                  popover [icon]
                                  progress_bar [tooltip]
                                  slat [icon, tooltip]
                                  stat [icon, tooltip]
                                  tab_pane
                                  table [icon, tooltip]
                                  task [icon, tooltip]

  PATTERN_COMPONENT_NAMES    = %i[activity_feed [icon, tooltip]
                                  button_group [tooltip]
                                  button_toolbar [tooltip]
                                  card [icon, tooltip]
                                  carousel [icon, tooltip]
                                  collapse [icon, tooltip]
                                  dropdown [icon, tooltip]
                                  dropdown_menu
                                  empty_state [icon, tooltip]
                                  filter_bar [tooltip]
                                  form_group [tooltip]
                                  graph
                                  jumbotron
                                  list_group
                                  media [tooltip]
                                  modal [icon]
                                  navbar
                                  navbar_nav
                                  page_header
                                  slat_list [tooltip]
                                  tab_content
                                  task_list
                                  tile [icon, tooltip]
                                  tile_body [icon, tooltip]
                                  tile_header [icon, tooltip]
                                  tile_section [icon]

