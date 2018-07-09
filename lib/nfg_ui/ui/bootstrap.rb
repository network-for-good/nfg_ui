module NfgUi
  module UI
    # The class that yields the component for the view
    class Bootstrap < NfgUi::UI::Base
      def initialize(view_context, component_name = nil, *traits, **options, &block)
        super
        if NfgUi::BOOTSTRAP_COMPONENT_NAMES.include?(component_name)
          initializer(component_name, *traits, **options, &block)
        else
          raise NameError.new(":#{component_name} isn't a registered bootstrap component.\nDid you mean to use `= ui.bootstrap :#{component_name}`? Perhaps you meant `= ui.nfg :#{component_name}`? \n\nCheck your spelling. Registered bootstrap component_names include:\n#{NfgUi::BOOTSTRAP_COMPONENT_NAMES.join("\n")}")
        end
      end

      def bootstrap?
        true
      end

      private

      def component_name_folder
        component.component_family.try(:to_s).try(:pluralize)
      end

      def group
        'bootstrap'
      end

      def grouping_folder
        'bootstrap'
      end

      def ancestry_string
        "NfgUi::Bootstrap::Components::#{class_name}"
      end

      def components_within_group(*)
        NfgUi::BOOTSTRAP_COMPONENT_NAMES
      end
    end
  end
end
