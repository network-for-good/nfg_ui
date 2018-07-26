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

  # Order is important
  require_relative 'nfg_ui/utilities'
  require_relative 'nfg_ui/ui'
  require_relative 'nfg_ui/bootstrap'
  require_relative 'nfg_ui/components'

  BOOTSTRAP_THEMES           = %i[primary
                                  secondary
                                  success
                                  danger
                                  warning
                                  info
                                  light
                                  dark].freeze

  BOOTSTRAP_COMPONENT_NAMES  = %i[alert
                                  badge
                                  breadcrumb
                                  breadcrumb_item
                                  button
                                  button_group
                                  button_toolbar
                                  card
                                  carousel
                                  dropdown
                                  embed
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
                                  table].freeze

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
                                  embed
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
                                  task].freeze

  PATTERN_COMPONENT_NAMES    = %i[activity_feed
                                  button_group
                                  button_toolbar
                                  card
                                  carousel
                                  collapse
                                  empty_state
                                  filter_bar
                                  form_group
                                  graph
                                  jumbotron
                                  list_group
                                  media_group
                                  modal
                                  navbar
                                  page_header
                                  slat_list
                                  task_list
                                  tile
                                  tile_body
                                  tile_header
                                  tile_section].freeze
end
