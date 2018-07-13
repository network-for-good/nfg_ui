#= require jquery3
#= require popper
#= require select2
#= require bootstrap

#= require_self
#= require nfg_ui/collapsible_toggle
#= require nfg_ui/vendor/select2
#= require nfg_ui/vendor/tooltips

window.NfgUi = {}

if $("head [data-turbolinks-track='reload']").length
  window.NfgUi.readyOrTurbolinksLoad = "turbolinks:load"
else
  window.NfgUi.readyOrTurbolinksLoad = "ready"
