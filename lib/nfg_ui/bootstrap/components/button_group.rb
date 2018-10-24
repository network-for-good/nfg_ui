# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Button Group Component
      # An optional parent of the Button component
      # https://getbootstrap.com/docs/4.1/components/breadcrumb/
      class ButtonGroup < Bootstrap::Components::Base
        include Bootstrap::Utilities::Sizable

        def vertical
          options.fetch(:vertical, false)
        end

        private

        def assistive_html_attributes
          p "====== Printed from: (Bootstrap::Components::ButtonGroup) self.class.name: #{self.class.name} method: #{__method__}"
          super.merge!(role: 'group', aria: { label: 'action buttons' })
        end

        def component_css_class
          p "====== Printed from: (Bootstrap::Components::ButtonGroup) self.class.name: #{self.class.name} method: #{__method__}"
          'btn-group'
        end
      end
    end
  end
end
