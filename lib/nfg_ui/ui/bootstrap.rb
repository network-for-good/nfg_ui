# frozen_string_literal: true

module NfgUi
  module UI
    # The class that yields the component for the view
    class Bootstrap < NfgUi::UI::Base
      def initialize(view_context, component_name = nil, *traits, **options, &block)
        p "====== (UI::Bootstrap::Base) self.class.name: #{self.class.name} method: #{__method__}"
        super
        if NfgUi::BOOTSTRAP_COMPONENT_NAMES.include?(component_name)
          initializer(component_name, *traits, **options, &block)
        else
          raise NameError.new(":#{component_name} isn't a registered bootstrap component.\nDid you mean to use `= ui.bootstrap :#{component_name}`? Perhaps you meant `= ui.nfg :#{component_name}`? \n\nCheck your spelling. Registered bootstrap component_names include:\n#{NfgUi::BOOTSTRAP_COMPONENT_NAMES.join("\n")}")
        end
      end

      def bootstrap?
        p "====== (UI::Bootstrap::Base) self.class.name: #{self.class.name} method: #{__method__}"
        true
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
