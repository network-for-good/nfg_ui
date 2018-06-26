require 'nfg_ui/engine'

module NfgUi
  require 'bootstrap'
  require 'font-awesome-rails'
  require 'haml'
  require 'sass-rails'
  require 'select2-rails'
  ActiveSupport.on_load(:active_record) { include Helper }
end
