if $("head [data-turbolinks-track='reload']").length > 0
  NfgUi.readyOrTurboLinksLoad = eval("$(document).on('turbolinks:load')")
else
  NfgUi.readyOrTurboLinksLoad = eval("$(document).ready")

# Usage example:
# NfgUi.readyOrTurboLinksLoad ->
#   alert 'hello!'
