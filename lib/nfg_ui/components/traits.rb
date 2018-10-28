# frozen_string_literal: true

module NfgUi
  module Components
    # Centralizes and autoloads traits for design system components
    # Trait modules must have the same name as the component they represent.
    # This provides autoloading of traits.
    module Traits
      TRAIT_MODULES = %i[Alert
                         Button
                         ButtonGroup
                         Card
                         Collapse
                         Icon
                         PageHeader
                         Size
                         Theme
                         Vertical].freeze

      extend ActiveSupport::Autoload
      TRAIT_MODULES.each { |trait_module| autoload trait_module }

      REGISTERED_TRAITS = TRAIT_MODULES.collect { |trait| "NfgUi::Components::Traits::#{trait}::TRAITS".constantize }.reject(&:empty?).flatten
    end
  end
end
