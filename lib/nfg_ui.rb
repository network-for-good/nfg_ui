# frozen_string_literal: true

require 'nfg_ui/engine'

# Core documentation coming soon.
# In the meantime, rendering usage and basic documentation
# can be found within the NfgUi::Render helper:
# lib/nfg_ui/helpers/render.rb
module NfgUi
  p ":::::: #{__FILE__.split('/').last.to_s} :::::: #{__FILE__} :::::: Loaded"
  require 'bootstrap'
  require 'font-awesome-rails'
  require 'haml'
  require 'sass-rails'
  require 'select2-rails'

  ActiveSupport.on_load(:active_record) { include Helper }

  extend ActiveSupport::Autoload

  autoload :Helpers
  autoload :Utilities
  autoload :Builder

  eager_autoload do
    autoload :Bootstrap
    autoload :Components
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
