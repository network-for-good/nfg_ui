# frozen_string_literal: true

require 'nfg_ui/engine'

# Core documentation coming soon.
# In the meantime, rendering/builder usage and basic documentation
# can be found within the NfgUi::Builder module:
# lib/nfg_ui/builder.rb
module NfgUi
  require 'bootstrap'
  require 'font-awesome-rails'
  require 'haml'
  require 'sass-rails'
  require 'select2-rails'

  # Autoloads app/helpers/nfg_ui/helper.rb
  # Which is responsible for 'include'ing
  # all of the actual view helpers
  ActiveSupport.on_load(:active_record) { include Helper }

  extend ActiveSupport::Autoload

  autoload :Helpers
  autoload :Utilities
  autoload :Builder

  eager_autoload do
    autoload :Bootstrap
    autoload :Components
  end

  def self.eager_load!
    super
    NfgUi::Bootstrap.eager_load!
    NfgUi::Components.eager_load!
  end

  GROUPING_NAMES = %i[foundations elements patterns].freeze

  FOUNDATION_COMPONENT_NAMES = %i[color
                                  icon
                                  image
                                  input
                                  grid
                                  typeface].freeze

  ELEMENT_COMPONENT_NAMES    = %i[activity
                                  alert
                                  badge
                                  button
                                  chart
                                  dropdown
                                  form_group
                                  input_group
                                  key
                                  list_group_item
                                  loader
                                  media_object
                                  nav
                                  breadcrumb
                                  breadcrumb_item
                                  popover
                                  progress_bar
                                  slat
                                  table
                                  task
                                  tooltip].freeze

  PATTERN_COMPONENT_NAMES    = %i[color
                                  icon
                                  image
                                  input
                                  grid
                                  typeface].freeze
end
