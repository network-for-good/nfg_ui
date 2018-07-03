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

        private

        def component_css_class
          'btn'
        end

        def assistive_html_attributes
          active? ? super.merge(aria: { pressed: true }) : super
        end

        # To be expanded later
        def trait_css_classes
          traits.include?(:block) ? "#{component_css_class}-block" : super
        end
      end
    end
  end
end
