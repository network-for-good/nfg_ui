# frozen_string_literal: true

require 'nfg_ui/engine'

module NfgUi
  # Theirs
  require 'bootstrap'
  require 'font-awesome-rails'
  require 'haml'
  require 'sass-rails'
  require 'select2-rails'

  # Ours
  require_relative 'nfg_ui/bootstrap/utilities'
  require_relative 'nfg_ui/bootstrap/components'
  require_relative 'nfg_ui/utilities'
  require_relative 'nfg_ui/components'

  ActiveSupport.on_load(:active_record) { include Helper }
end
