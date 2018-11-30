# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Dropdown Component
      # https://getbootstrap.com/docs/4.1/components/dropdowns/
      class DropdownMenu < NfgUi::Bootstrap::Components::Base
        def component_family
          :dropdown
        end

        def right
          options.fetch(:right, false)
        end

        def render
          content_tag(:div, html_options) do
            (block_given? ? yield : body)
          end
        end

        private

        def css_classes
          [
            super,
            ('dropdown-menu-right' if right)
          ].join(' ').squish
        end

        def non_html_attribute_options
          super.push(:right)
        end
      end
    end
  end
end
