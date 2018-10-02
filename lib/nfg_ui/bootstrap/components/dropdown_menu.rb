# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Dropdown Component
      # https://getbootstrap.com/docs/4.1/components/dropdowns/
      class DropdownMenu < Bootstrap::Components::Base
        def component_family
          :dropdown
        end

        def right
          options.fetch(:right, false)
        end

        private

        def css_classes
          right ? super + ' dropdown-menu-right' : super
        end

        def non_html_attribute_options
          super.push(:right)
        end
      end
    end
  end
end
