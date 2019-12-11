#= require jquery3
#= require popper
#= require select2
#= require bootstrap
#= require moment
#= require nfg_ui/vendor/bootstrap-datetimepicker.min

#= require_self
#= require nfg_ui/collapsible_toggle
#= require nfg_ui/select2
#= require nfg_ui/tooltips
#= require nfg_ui/datetimepicker_configuration

window.NfgUi = {}

if $("head [data-turbolinks-track='reload']").length
  window.NfgUi.readyOrTurbolinksLoad = "turbolinks:load"
else
  window.NfgUi.readyOrTurbolinksLoad = "ready"
