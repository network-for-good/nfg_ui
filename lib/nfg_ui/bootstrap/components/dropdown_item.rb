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

        # We do not want to overwrite button_to's interpretation
        # of `remote`. Conditionally include Remotable
        # when not using as: :button_to
        def component_initialize
          if as != :button_to
            extend Bootstrap::Utilities::Remotable
          end
        end

        def component_family
          :dropdown
        end

        def render
          if tooltip && disabled
            content_tag(:span, disabled_component_tooltip_wrapper_html_options) do
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

        def default_html_wrapper_element
          :a
        end
      end
    end
  end
end
