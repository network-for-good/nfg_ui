if $("head [data-turbolinks-track='reload']").length
  window.NfgUi.readyOrTurbolinksLoad = "turbolinks:load"
else
  window.NfgUi.readyOrTurbolinksLoad = "ready"


