init_plugin = (parent) ->
  return unless $('select.select2').length

  # Just incase anything's changed, refresh select2 via triggering a 'change' event
  parent.find('select.select2').trigger 'change'

  parent.find('select.select2').select2
    # Find the explicit parent to help resolve issues
    # with Safari where setting $('body') caused the
    # page to jump to the bottom when interacting
    # with the select2 menu.
    dropdownParent: parent.find('select.select2').parent()

initNfgUiSelect2 = () ->
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
  # Also re-initializing the select2 element to fix the issue mentioned in
  # https://bonterra.atlassian.net/browse/NFG-513
  # Reason: re-initialization of body affects the select2 inputs present on the screen.
  # The destroy() and reinitialize process ensures Select2 works correctly after the modal
  # is closed.
  doc.on 'hidden.bs.modal ajax:success', (e) ->
    init_plugin body
    setTimeout ->
      $('select.select2').each ->
        $(this).select2('destroy').select2()
    , 0

if NfgUi.turbolinks
  $(document).on('turbolinks:load', initNfgUiSelect2)
else
  $(document).ready(initNfgUiSelect2)
