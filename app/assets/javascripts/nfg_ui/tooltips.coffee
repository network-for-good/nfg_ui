init_plugin = (parent) ->
  return unless $("[data-toggle='tooltip']").length && !('ontouchstart' of window)
  $("[data-toggle='tooltip']").tooltip('dispose')
  parent.find("[data-toggle='tooltip']").tooltip()
  $('body').tooltip selector: "[data-toggle~='tooltip']"

$ ->
  doc = $(document)
  body = $('body')
  modal = $('.modal')

  init_plugin body

  doc.on 'shown.bs.modal', (e) ->
    init_plugin modal

  doc.on 'hidden.bs.modal ajax:success', (e, xhr, settings) ->
    init_plugin body
