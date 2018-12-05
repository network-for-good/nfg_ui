# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Dropdown Items Component
      # https://getbootstrap.com/docs/4.1/components/dropdowns/#menu-items
      class DropdownItem < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Wrappable
        include Bootstrap::Utilities::Activatable
        include Bootstrap::Utilities::Disableable
        include Bootstrap::Utilities::Tooltipable
        include Bootstrap::Utilities::Remotable

        def component_family
          :dropdown
        end

        def render
          if tooltip && disabled
            content_tag(:span, disabled_component_tooltip_wrapper_html_options.merge!(class: 'dropdown-item disabled')) do
              content_tag(as, html_options.except(:href)) do
                (block_given? ? yield : body)
              end
            end
          else
            content_tag(as, html_options) do
              (block_given? ? yield : body)
            end
          end
        end

        private

        # When a dropdown item is both disabled AND given a tooltip
        # We need to restructure the syntax to wrap the dropdown item in
        # a faux dropdown item that also contains the tooltip content
        #
        # This is similar to disabled, tooltipped buttons but works to maintain the UI
        # of the dropdown menu
        def css_classes
          if disabled && tooltip.present?
            super.gsub(component_css_class, '').gsub('disabled', '')
          else
            super
          end
        end

        def default_html_wrapper_element
          :a
        end
      end
    end
  end
end
