class NfgUi.PreventClickableDisabledElement
  constructor: (@el) ->
    @el.click (e) =>
      @preventClick e

  preventClick: (e) ->
    if IE(10)
      e.preventDefault()

  # IE version checker from https://stackoverflow.com/a/16136040
  IE = (v) ->
    RegExp('msie' + (if !isNaN(v) then '\\s' + v else ''), 'i').test navigator.userAgent

init_plugin = (el) ->
  el.each ->
    inst = new NfgUi.PreventClickableDisabledElement $(@)

initNfgUiPreventClickableDisabledElement = () ->
  elSelectorClass = '.disabled'
  elAttribute = '[disabled]'

  $(document).on 'ajax:success', (e, xhr, settings) ->
    if $(elSelectorClass).length
      init_plugin $(elSelectorClass)
    if $(elAttribute).length
      # We check for .disabled first, if it's got the css class
      # then it's already been initialized.
      unless $(elAttribute).hasClass 'disabled'
        # Otherwise, initialize using $('[disabled]')
        init_plugin $(elAttribute)

  if $(elSelectorClass).length
      init_plugin $(elSelectorClass)

  if $(elAttribute).length
    unless $(elAttribute).hasClass 'disabled'
      init_plugin $(elAttribute)

if NfgUi.turbolinks
  $(document).on('turbolinks:load', initNfgUiPreventClickableDisabledElement)
else
  $(document).ready(initNfgUiPreventClickableDisabledElement)