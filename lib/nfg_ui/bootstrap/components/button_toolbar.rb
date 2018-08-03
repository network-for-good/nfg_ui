# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Button Toolbar Component
      class ButtonToolbar < Bootstrap::Components::Base
        # include Bootstrap::Utilities::AriaAssistable

        # def initialize(*)
        #   super
        #   build_aria(aria_key: :label, aria_value: 'toolbar with action buttons')
        # end

        private

        def component_css_class
          p "====== Printed from: (Bootstrap::Components::ButtonToolbar) self.class.name: #{self.class.name} method: #{__method__}"
          'btn-toolbar'
        end

        def assistive_html_attributes
          p "====== Printed from: (Bootstrap::Components::ButtonToolbar) self.class.name: #{self.class.name} method: #{__method__}"
          super.merge!(role: options.fetch(:role, 'toolbar'))
        end
      end
    end
  end
end
