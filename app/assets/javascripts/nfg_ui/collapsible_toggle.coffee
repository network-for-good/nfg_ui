class NfgUi.CollapsibleToggle
  constructor: (@el) ->
    @target = $(@el.data 'target')
    @iconBase = 'fa'
    @collapseIconClass = "fa-#{@el.data 'collapsed-icon'}"
    @collapsedIconClass = "fa-#{@el.data 'collapse-icon'}"

    @initialize()

  initialize: ->
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

$ ->
  el = $("[data-toggle='collapse']")
  return unless el.length
  el.each ->
    inst = new NfgUi.CollapsibleToggle $(@)
