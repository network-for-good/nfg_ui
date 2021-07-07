if typeof NfgUi == "undefined"
  window.NfgUi = {}

class NfgUi.CollapsibleToggle
  constructor: (@el) ->
    @target = @collapseTarget()
    @iconBase = 'fa'
    @collapseIconClass = "fa-#{@el.data 'collapsed-icon'}"
    @collapsedIconClass = "fa-#{@el.data 'collapse-icon'}"

    @initialize()

    @el.click (e) =>
      @swapIcon()

  initialize: ->
    if @target.hasClass 'show'
      @el
      .find ".#{@collapseIconClass}"
      .removeClass @collapseIconClass
      .addClass @collapsedIconClass
    else
      @el
        .find ".#{@collapsedIconClass}"
        .removeClass @collapsedIconClass
        .addClass @collapseIconClass

  collapseTarget: ->
    if @el.is('a') then return $(@el.attr 'href')
    if @el.is('button') then return $(@el.data 'target')

  swapIcon: ->
    @target.on 'show.bs.collapse', (e) =>
      @el
        .find ".#{@collapseIconClass}"
        .removeClass @collapseIconClass
        .addClass @collapsedIconClass

    @target.on 'hide.bs.collapse', (e) =>
      @el
        .find ".#{@collapsedIconClass}"
        .removeClass @collapsedIconClass
        .addClass @collapseIconClass

initNfgUiCollapsibleToggle = () ->
  el = $("[data-toggle='collapse'][data-collapse-icon][data-collapsed-icon]")

  return unless el.length
  el.each ->
    inst = new NfgUi.CollapsibleToggle $(@)

if NfgUi.turbolinks
  $(document).on('turbolinks:load', initNfgUiCollapsibleToggle)
else
  $(document).ready(initNfgUiCollapsibleToggle)