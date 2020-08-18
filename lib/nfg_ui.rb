# frozen_string_literal: true

require 'nfg_ui/engine'
require 'bootstrap'
require 'coffee-script'
require 'font-awesome-rails'
require 'haml'
require 'jquery-rails'
require 'sass-rails'
require 'select2-rails'
require 'inky'
require 'momentjs-rails'
require 'browser'

module NfgUi
  DEFAULT_TIP_ICON = 'question-circle-o'
  DEFAULT_TIP_THEME = :info

  DEFAULT_BOOTSTRAP_THEME    = :primary

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
                                  card_body
                                  card_footer
                                  card_header
                                  card_image
                                  card_image_overlay
                                  carousel
                                  carousel_caption
                                  carousel_control
                                  carousel_indicators
                                  carousel_item
                                  collapse
                                  dropdown
                                  dropdown_divider
                                  dropdown_header
                                  dropdown_item
                                  dropdown_menu
                                  dropdown_toggle
                                  embed
                                  form
                                  input_group
                                  jumbotron
                                  list_group
                                  list_group_item
                                  media
                                  media_body
                                  media_object
                                  modal
                                  modal_body
                                  modal_footer
                                  modal_header
                                  nav
                                  nav_item
                                  nav_link
                                  navbar
                                  navbar_brand
                                  navbar_nav
                                  navbar_text
                                  navbar_toggler
                                  page_item
                                  pagination
                                  popover
                                  progress
                                  tab_content
                                  tab_pane
                                  table].freeze

  GROUPING_NAMES             = %i[foundations
                                  elements
                                  patterns].freeze

  FOUNDATION_COMPONENT_NAMES = %i[color
                                  icon
                                  illustration
                                  image
                                  input
                                  grid
                                  typeface].freeze

  ELEMENT_COMPONENT_NAMES    = %i[activity
                                  alert
                                  avatar
                                  badge
                                  breadcrumb
                                  breadcrumb_item
                                  button
                                  card_body
                                  card_footer
                                  card_header
                                  card_image
                                  card_image_overlay
                                  carousel_caption
                                  carousel_control
                                  carousel_indicators
                                  carousel_item
                                  chart
                                  dropdown_divider
                                  dropdown_header
                                  dropdown_item
                                  dropdown_toggle
                                  embed
                                  form_control
                                  input_group
                                  key
                                  list_group_item
                                  loader
                                  media_body
                                  media_object
                                  modal_body
                                  modal_footer
                                  modal_header
                                  nav
                                  nav_item
                                  nav_link
                                  navbar_brand
                                  navbar_text
                                  navbar_toggler
                                  page_item
                                  popover
                                  progress_bar
                                  slat_action
                                  slat_body
                                  slat_item
                                  stat
                                  step
                                  step_indicator
                                  tab_pane
                                  table
                                  task].freeze

  PATTERN_COMPONENT_NAMES    = %i[activity_feed
                                  button_group
                                  button_toolbar
                                  card
                                  carousel
                                  collapse
                                  dropdown
                                  dropdown_menu
                                  empty_state
                                  filter_bar
                                  form_group
                                  graph
                                  jumbotron
                                  list_group
                                  media
                                  modal
                                  navbar
                                  navbar_nav
                                  page_header
                                  pagination
                                  progress
                                  slat
                                  slat_actions
                                  slat_header
                                  slats
                                  steps
                                  tab_content
                                  task_list
                                  tile
                                  tile_body
                                  tile_header
                                  tile_section].freeze
end