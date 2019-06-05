# Changelog

# 0.9.9
*Non-breaking changes*
* SlatActions can now accept the :button option.
  * Example usage: `= ui.nfg :slat_actions, icon: 'trash', body: 'Delete', menu: false, button: true`
* A patching system has been introduced for the design system (not `bootstrap`).
  * Patching a component will now signal that we are introducing functionality that we intend to remove. It also provides a pattern for implementing "quick fixes" and provides a single module suite to review for code debt.
* Along with the patching concept, a new pattern for "quick built" components is now available. This allows us to remove "pass through" methods from the parent component's class and keep it in its own isolated area.
  * For now, this lives in the "Patching" folder, but will eventually be moved when further adopted since this particular implementation is a signal of code debt.
  * The module name will use a naming convention as such:
    * `Integrated` indicating it is integrated in some way into the component's rendering.
    * `SpiritualChildComponent` class name (ex: `SlatAction`)
    * The actual component implemented is not necessarily important. In the `IntegratedSlatAction` module, we actually leverage both a text link and a `Button` component. Neither of which calls the actual SlatAction component. While this may change later depending how we handle the evolution of our most complex component suite... *slats*, *the most important point is to signal* what this is being integrated _as_* Thus, The `IntegratedSlatAction` is communicated as a "slat action" integrated into this component. Nifty.
* CSS improvements introduced for the slat actions.

# <= 0.9.8.18
* Not documented

