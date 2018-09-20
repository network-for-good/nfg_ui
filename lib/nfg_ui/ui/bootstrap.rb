# frozen_string_literal: true

module NfgUi
  module UI
    # The class that yields the component for the view
    class Bootstrap
      include NfgUi::UI::Utilities::Initializer

      attr_accessor :view_context
      # attr_reader :component_name_folder

      def initialize(view_context, component_name = nil, *traits, **options, &block)
        p "====== Printed from: (UI::Bootstrap::Base) self.class.name: #{self.class.name} method: #{__method__}"
        self.view_context = view_context
        initializer(component_name, *traits, **options, &block)
        # @component_name_folder = component.component_family.to_s.pluralize if component.component_family.present?
        # raise component.send(:component_family).inspect
      end

      private

      def component_name_folder
        p "====== Printed from: (UI::Bootstrap::Base) self.class.name: #{self.class.name} method: #{__method__}"
        # component.component_family.to_s.pluralize if component.component_family.present?
        component.component_family.to_s.pluralize
        # ''
      end

      def group
        p "====== Printed from: (UI::Bootstrap::Base) self.class.name: #{self.class.name} method: #{__method__}"
        'bootstrap'
      end

      def grouping_folder
        p "====== Printed from: (UI::Bootstrap::Base) self.class.name: #{self.class.name} method: #{__method__}"
        'bootstrap'
      end

      def ancestry_string
        p "====== Printed from: (UI::Bootstrap::Base) self.class.name: #{self.class.name} method: #{__method__}"
        "NfgUi::Bootstrap::Components::#{class_name}"
      end

      def components_within_group(*)
        p "====== Printed from: (UI::Bootstrap::Base) self.class.name: #{self.class.name} method: #{__method__}"
        NfgUi::BOOTSTRAP_COMPONENT_NAMES
      end
    end
  end
end
