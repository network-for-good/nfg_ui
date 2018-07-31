# frozen_string_literal: true

module NfgUi
  module UI
    # The class that yields the component for the view
    class Bootstrap
      include NfgUi::UI::Utilities::Initializer

      attr_accessor :view_context

      def initialize(view_context, component_name = nil, *traits, **options, &block)
        p "====== (UI::Bootstrap::Base) self.class.name: #{self.class.name} method: #{__method__}"
        self.view_context = view_context
        initializer(component_name, *traits, **options, &block)
      end

      private

      def component_name_folder
        p "====== (UI::Bootstrap::Base) self.class.name: #{self.class.name} method: #{__method__}"
        component.try(:component_family).try(:to_s).try(:pluralize)
      end

      def group
        p "====== (UI::Bootstrap::Base) self.class.name: #{self.class.name} method: #{__method__}"
        'bootstrap'
      end

      def grouping_folder
        p "====== (UI::Bootstrap::Base) self.class.name: #{self.class.name} method: #{__method__}"
        'bootstrap'
      end

      def ancestry_string
        p "====== (UI::Bootstrap::Base) self.class.name: #{self.class.name} method: #{__method__}"
        "NfgUi::Bootstrap::Components::#{class_name}"
      end

      def components_within_group(*)
        p "====== (UI::Bootstrap::Base) self.class.name: #{self.class.name} method: #{__method__}"
        NfgUi::BOOTSTRAP_COMPONENT_NAMES
      end
    end
  end
end
