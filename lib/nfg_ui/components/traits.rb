# frozen_string_literal: true

module NfgUi
  module Components
    # Centralizes traits for design system components
    # Trait modules must have the same name as the component they represent.
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
                         Muted
                         Nav
                         Navbar
                         NavItem
                         PageHeader
                         Pill
                         ProgressBar
                         Remote
                         Responsive
                         Size
                         Step
                         Slats
                         SlatItem
                         Table
                         Theme
                         Typeface
                         Vertical].freeze

      REGISTERED_TRAITS = TRAIT_MODULES.collect { |trait| "NfgUi::Components::Traits::#{trait}::TRAITS".constantize }.reject(&:empty?).flatten
    end
  end
end
