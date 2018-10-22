# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Dropdown Component
      # https://getbootstrap.com/docs/4.1/components/dropdowns/
      class DropdownItem < Bootstrap::Components::Base
        include Bootstrap::Utilities::Wrappable
        include Bootstrap::Utilities::Activatable
        include Bootstrap::Utilities::Disableable
        include Bootstrap::Utilities::Tooltipable

        def component_family
          :dropdown
        end

        # def href
        #   options.fetch(:href, nil)
        # end

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

        private

        def default_html_wrapper_element
          p "====== Printed from: (Bootstrap::Components::DropdownItem) self.class.name: #{self.class.name} method: #{__method__}"
          :a
        end
      end
    end
  end
end
