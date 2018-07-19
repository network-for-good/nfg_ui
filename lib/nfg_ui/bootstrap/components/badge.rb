# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Badge Component
      # https://getbootstrap.com/docs/4.1/components/badge/
      class Badge < Bootstrap::Components::Base
        require_relative '../utilities/themeable'
        require_relative '../utilities/wrappable'

        include Bootstrap::Utilities::Themeable
        include Bootstrap::Utilities::Wrappable

        def pill?
          traits.include?(:pill)
        end

        private

        def css_classes
          pill? ? super + " #{component_css_class}-pill" : super
        end

        def default_html_wrapper_element
          :span
        end
      end
    end
  end
end
