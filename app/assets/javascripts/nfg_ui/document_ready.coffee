if $("head [data-turbolinks-track='reload']").length > 0
  NfgUi.readyOrTurboLinksLoad = $(document).on('turbolinks:load')
else
  NfgUi.readyOrTurboLinksLoad = $(document).ready

# Usage example:
# NfgUi.readyOrTurboLinksLoad ->
#   alert 'hello!'
