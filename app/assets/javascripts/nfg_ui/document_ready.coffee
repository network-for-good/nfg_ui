# Facilitate 'on ready' event for turbolinks and non-turbolinks environments

if typeof NfgUi == 'undefined'
  window.NfgUi = {}

NfgUi.turbolinks = ($("head [data-turbolinks-track='reload']").length > 0)
