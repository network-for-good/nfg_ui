# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Slat doc coming soon
      class SlatAction < NfgUi::Components::Elements::DropdownItem
        def component_family
          :slats
        end

        private

        def component_css_class
          'dropdown-item'
        end
      end
    end
  end
end
