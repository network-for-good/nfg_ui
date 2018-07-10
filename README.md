= NfgUi
The authoritative resource for the Network for Good front-end UI, empowered by the NFG Design System.

```ruby
gem 'nfg_ui', git: 'https://github.com/network-for-good/nfg_ui'
```

The result of 4 years of study, practice, implementation, planning, drafting and sweat. NFG UX & UI team (J&K) are excited to bring you... the *Network For Good design system* gem or: `nfg_ui` gem. This bad boy is an all encompassing one-stop shop for everything front-end for Network for Good products.

With this gem, you can stand up a brand new rails app and it will seamlessly, from day 1, look, feel and be a Network for Good product. *Huzzah*


## Accessing Component Code Examples & Documentation:
to review the documentation for the components, get code samples and browse the library, follow the instructions at the bottom for getting the gem setup locally. It has its own `test_app` so the documentation is hosted there and the gem doesn't need to be added to a seperate parent app (unless you want to). We intend to get this online in its own dedicated space... until then, that's your best bet for browsing docs.

### Import & Require the gem's assets
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

## Usage

### Network for Good design system components

This gem allows you to add any NFG design component to your haml view at command. You can build one line, all inclusive components and build out high level pre-designed and pre-configured context-specific components.

Components also come with traits. Traits are stackable and overwriteable. Traits are meaningful symbols added as the first array of arguments on your component. Read more about traits below. The key value of traits: it provides pre-set and pre-designed components out of the box so that you don't need to go through the monotonous task of adding theme colors, sizes, headlines, etc every time you need to use that component. *Handy*

All components accept the same attributes when appropriate. This list will expand but here is a sample:

* All html attributes (`id`, `data`, `aria`, `required`, if it's an attribute, it's available)
* `body: 'Inserted content into the obvious content space for the component'`
* `title: 'For modals and tiles'`
* `headline: 'For components with headlines like media objects'`
* `:collapsible` and `:collapsed`
* more to come...


Examples:
```haml
// Produce a styled, pre-designed submit button for your form on the fly
= ui.nfg :button, :submit

// Build your own button
= ui.nfg :button, :danger, data: { describe: 'delete-button' } do
  = ui.nfg :icon, 'trash', class: 'mr-1', text: 'Delete Row'
```

 bootstrap4 component, coded to strict bootstrap standards via `= ui.bootstrap :my_component, options...`

## Library of components

## Setup

1. Clone repo:

```
$ git clone https://github.com/network-for-good/nfg_ui.git
```

2. Bundle gems

```
$ bundle exec bundle install
```

3. Create database

```
$ rake db:create

# which should output:
# Created database 'db/development.sqlite3'
# Created database 'db/test.sqlite3'
```

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
