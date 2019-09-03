# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Button Group Component
      # An optional parent of the Button component
      class ButtonGroup < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::DropdownDirectionable
        include Bootstrap::Utilities::Sizable

        def vertical
          options.fetch(:vertical, false)
        end

        private

        def assistive_html_attributes
          aria = options[:aria].present? ? options[:aria] : {}
          aria.merge!(label: 'action buttons')

          super.merge!(role: 'group', aria: aria)
        end

        def component_css_class
          "btn-group#{'-vertical' if vertical}"
        end

        def non_html_attribute_options
          super.push(:vertical)
        end
      end
    end
  end
end
