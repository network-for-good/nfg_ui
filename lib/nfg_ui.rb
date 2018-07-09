# frozen_string_literal: true

require 'nfg_ui/engine'

module NfgUi
  require 'bootstrap'
  require 'coffee-script'
  require 'font-awesome-rails'
  require 'haml'
  require 'jquery-rails'
  require 'sass-rails'
  require 'select2-rails'
  # require 'backport_new_renderer'

  # Autoloading inspired by simple_form methodology
  # and the fact that this is a significantly sized library.
  # It seems to make sense to not try to pre-load the dozens and dozens
  # of assets that comprise this library.
  #
  # Reference article:
  # http://blog.plataformatec.com.br/2012/08/eager-loading-for-greater-good/
  extend ActiveSupport::Autoload

  autoload :UI

  eager_autoload do
    autoload :Bootstrap
    autoload :Components
  end

  def self.eager_load!
    super
    NfgUi::Bootstrap.eager_load!
    NfgUi::Components.eager_load!
  end

  BOOTSTRAP_COMPONENT_NAMES  = %i[alert
                                  badge
                                  breadcrumb
                                  breadcrumb_item
                                  button
                                  button_group
                                  card
                                  carousel
                                  dropdown
                                  form
                                  input_group
                                  jumbotron
                                  list_group
                                  list_group_item
                                  media_object
                                  modal
                                  nav
                                  navbar
                                  pagination
                                  popover
                                  progress
                                  table
                                  tooltip].freeze

  GROUPING_NAMES             = %i[foundations
                                  elements
                                  patterns].freeze

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

require 'nfg_ui/railtie' if defined?(Rails)
