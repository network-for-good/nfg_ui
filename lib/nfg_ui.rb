# frozen_string_literal: true

require 'nfg_ui/engine'
require 'active_support'

# Core documentation coming soon.
# In the meantime, rendering usage and basic documentation
# can be found within the NfgUi::Render helper:
# lib/nfg_ui/helpers/render.rb
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

  extend ActiveSupport::Autoload
  
  autoload :Helpers
end
