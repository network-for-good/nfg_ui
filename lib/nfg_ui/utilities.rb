# frozen_string_literal: true

module NfgUi
  # Supporter utilities that make life easier by
  # looking up information about components and their
  # relationship with the design system.
  #
  # For example, gathering the template's file path location
  # for rendering a partial.
  #
  # Or, another example: figuring out which group a component
  # belongs to.
  module Utilities
    p ":::::: #{__FILE__.split('/').last.to_s} :::::: #{__FILE__} :::::: Loaded"
    extend ActiveSupport::Autoload
    
    autoload :PartialPath
    autoload :Groupings
  end
end
