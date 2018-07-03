# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows component to utilize the bootstrap4 theme color palette
      module Themeable
        attr_accessor :theme

        def initialize(component_options)
          super
          self.theme = component_options.fetch(:theme, default_theme)
        end

        def defaults
          super.merge!(theme: default_theme)
        end

        def css_classes
          [super, theme_css_class].join(' ')
        end

        def non_html_attribute_options
          super.push(:theme)
        end

        def theme_css_class
          "#{component_css_class}-#{outline}#{theme}" if bootstrap4_themes.include?(theme)
        end

        private

        def bootstrap4_themes
          %i[primary
             secondary
             success
             danger
             warning
             info
             light
             dark]
        end

        def default_theme
          :primary
        end

        def outline
          'outline-' if traits.include?(:outlined)
        end
      end
    end
  end
end
