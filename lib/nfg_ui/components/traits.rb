# frozen_string_literal: true

module NfgUi
  module Components
    # Centralizes and autoloads traits for design system components
    # Trait modules must have the same name as the component they represent.
    # This provides autoloading of traits.
    module Traits
      TRAIT_MODULES = %i[Active
                         Alert
                         Alignment
                         Button
                         ButtonGroup
                         Card
                         Collapse
                         Disable
                         DisableWith
                         Dismiss
                         DropdownToggle
                         Icon
                         ListGroup
                         Nav
                         Navbar
                         NavItem
                         PageHeader
                         Pill
                         ProgressBar
                         Remote
                         Size
                         Theme
                         Typeface
                         Vertical].freeze

      extend ActiveSupport::Autoload
      TRAIT_MODULES.each { |trait_module| autoload trait_module }

      REGISTERED_TRAITS = TRAIT_MODULES.collect { |trait| "NfgUi::Components::Traits::#{trait}::TRAITS".constantize }.reject(&:empty?).flatten
    end
  end
end
