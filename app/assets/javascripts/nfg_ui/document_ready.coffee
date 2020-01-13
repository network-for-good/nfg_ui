# Facilitate 'on ready' event for turbolinks and non-turbolinks environments

if typeof NfgUi == 'undefined'
  window.NfgUi = {}

if $("head [data-turbolinks-track='reload']").length > 0
  NfgUi.readyOrTurbolinksLoad = $(document).on('turbolinks:load')
else
  NfgUi.readyOrTurbolinksLoad = $(document).ready

# Usage example:
# NfgUi.readyOrTurbolinksLoad ->
#   alert 'hello!'
