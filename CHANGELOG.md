# Changelog
# 0.9.12
*Non-breaking changes*
* `NfgUi::Components::Elements::StepIndicator` becomes an `<a>` tag when `:href` is present in `:options` and becomes a `<span>` when `:href` is not present.
  * `StepIndicator` is now `Wrappable` and can have it's `:as` value changed in `:options`

# 0.9.11
*Non-breaking changes*
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

# 0.9.10
*Non-breaking changes*
* `NfgUi::Components::Foundations::Icon` now applies `aria-hidden='true'` by default when rendered to improve accessibility per Font Awesome documentation:
  * https://fontawesome.com/how-to-use/on-the-web/other-topics/accessibility
* Fixes an issue where slat actions (and other components, assumedly) were rendering two spacer css classes (ex: `NfgUi::Components::Foundations::Icon::LEFT_ICON_SPACER_CSS_CLASS`) when an icon was present (ex: `<i class="fa fa-heart ml-1 ml-1"></i> Text Example`)
* Further solidifies css class updates on the `Icon` when determining whether or not to apply spacer classes.
* Adds additional specs for `Icon` and thoroughly tests its `#render` method along with many contexts and edge cases that have caused issue or raised issues in the past.
* Adds a helpful `rescue` when using the `#substring_present?` helper method on specs communicating what the method interpretted instead of raising a useless `nil` regex match missing error.
* CSS improvements for event page jumbotron to behave like edgp on mobile

# 0.9.9
*Non-breaking changes*
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

# <= 0.9.8.18
* Not documented

