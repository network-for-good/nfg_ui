init_plugin = (parent) ->
  return unless $('select.select2').length
  
  # Just incase anything's changed, refresh select2 via triggering a 'change' event
  parent.find('select.select2').trigger 'change'

  parent.find('select.select2').select2
    dropdownParent: parent

$(document).on NfgUi.readyOrTurbolinksLoad, ->
  doc = $(document)
  body = $('body')
  modal = $('.modal')

  init_plugin body
  
  # use 'shown' tense on modal event
  # otherwise, no guarantee that the select menu will be on the page yet
  doc.on 'shown.bs.modal', '.modal', (e) ->
    init_plugin $('.modal-body')
    modal.attr 'tabindex', '' # remove negative tab index, per select2 docs on modals

  # Likewise with the shown.bs.modal, the same applies here for re-initializing on body
  # after the a tooltipped element is removed from the page
  doc.on 'hidden.bs.modal ajax:success', (e) ->
    init_plugin body
