# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Button Group Component
      # An optional parent of the Button component
      # https://getbootstrap.com/docs/4.1/components/breadcrumb/
      class ButtonGroup < Bootstrap::Components::Base
        include Bootstrap::Utilities::DropdownDirectionable
        include Bootstrap::Utilities::Sizable

        def vertical
          options.fetch(:vertical, false)
        end

        private

        def assistive_html_attributes
          super.merge!(role: 'group', aria: { label: 'action buttons' })
        end

        def component_css_class
          'btn-group'
        end
      end
    end
  end
end
