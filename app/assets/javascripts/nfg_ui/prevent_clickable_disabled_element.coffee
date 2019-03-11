class NfgUiPreventClickableDisabledElement
  constructor: (@el) ->
    console.log "prevent clickable is constructor"
    @el.click (e) =>
      console.log "el was clicked"
      @preventClick e

  preventClick: (e) ->
    if IE(10)
      e.preventDefault()

  # IE version checker from https://stackoverflow.com/a/16136040
  IE = (v) ->
    RegExp('msie' + (if !isNaN(v) then '\\s' + v else ''), 'i').test navigator.userAgent

init_plugin = (el) ->
  el.each ->
    inst = new NfgUiPreventClickableDisabledElement $(@)

$ ->
  elSelector = '.disabled'
  console.log "prevent clickable is running"
  
  $(document).on 'ajax:success', (e, xhr, settings) ->
    return unless $(elSelector).length
    init_plugin $(elSelector)

  return unless $(elSelector).length
  init_plugin $(elSelector)


