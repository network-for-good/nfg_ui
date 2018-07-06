# frozen_string_literal: true

require 'nfg_ui/engine'

# Core documentation coming soon.
# In the meantime, rendering/builder usage and basic documentation
# can be found within the NfgUi::Builder module:
# lib/nfg_ui/builder.rb
module NfgUi
  require 'bootstrap'
  require 'coffee-script'
  require 'font-awesome-rails'
  require 'haml'
  require 'jquery-rails'
  require 'sass-rails'
  require 'select2-rails'

  # Autoloads app/helpers/nfg_ui/helper.rb
  # Which is responsible for 'include'ing
  # all of the actual view helpers
  ActiveSupport.on_load(:active_record) { include Helper }

  # Autoloading inspired by simple_form methodology
  # and the fact that this is a significantly sized library.
  # It seems to make sense to not try to pre-load the dozens and dozens
  # of assets that comprise this library.
  #
  # Reference article:
  # http://blog.plataformatec.com.br/2012/08/eager-loading-for-greater-good/
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
                                  breadcrumb
                                  breadcrumb_item
                                  button
                                  chart
                                  dropdown
                                  form_control
                                  input_group
                                  key
                                  list_group_item
                                  loader
                                  media_object
                                  nav
                                  popover
                                  progress_bar
                                  slat
                                  stat
                                  table
                                  task
                                  tooltip].freeze

  PATTERN_COMPONENT_NAMES    = %i[activity_feed
                                  button_group
                                  card
                                  carousel
                                  empty_state
                                  filter_bar
                                  form_group
                                  graph
                                  jumbotron
                                  list_group
                                  media_group
                                  modal
                                  navbar
                                  slat_list
                                  task_list
                                  tile].freeze
end
