# frozen_string_literal: true

module NfgUi
  module Components
    # Base NFG UI component
    # Currently is a class that inherits the bootstrap base component 
    # because it provides everything needed for now.
    class Base < Bootstrap::Components::Base
      # Trait modules are automatically included
      # assuming the ancestry / naming convention is followed.
      #
      # Example:
      # NfgUi::Components::Foundations::Typeface   <-- Component
      # NfgUi::Components::Traits::Typeface        <-- Trait
      def initialize(component_options, view_context)
        include_trait_module if include_trait_module?
        super
      end

      private

      def include_trait_module?
        NfgUi::Components::Traits.const_defined?(class_name)
      end

      def include_trait_module
        singleton_class.send(:include, NfgUi::Components::Traits.const_get(class_name))
      end

      def class_name
        self.class.name.demodulize
      end
    end
  end
end
