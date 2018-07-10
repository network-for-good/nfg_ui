# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Button Component
      # https://getbootstrap.com/docs/4.1/components/buttons/
      class Button < Bootstrap::Components::Base
        include Bootstrap::Utilities::Themeable
        include Bootstrap::Utilities::Sizable
        include Bootstrap::Utilities::Wrappable
        include Bootstrap::Utilities::Activatable
        include Bootstrap::Utilities::Disableable
        include Bootstrap::Utilities::AriaAssistable

        def initialize(*)
          super
          build_aria(aria_key: :pressed, aria_value: true) if active?
        end

        private

        def component_css_class
          'btn'
        end

        def trait_css_classes
          traits.include?(:block) ? "#{component_css_class}-block" : super
        end
      end
    end
  end
end
