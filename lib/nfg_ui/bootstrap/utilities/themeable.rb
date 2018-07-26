# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows component to utilize the bootstrap4 theme color palette
      module Themeable
        attr_reader :theme, :outlined

        def initialize(*)
          super
          @theme = options.fetch(:theme, default_theme)
          @outlined = options.fetch(:outlined, traits.include?(:outlined))
        end

        private

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
          return if theme.nil?
          "#{theme_css_class_prefix}-#{outline_css_class_string}#{theme}"
        end

        def bootstrap4_themes
          NfgUi::BOOTSTRAP_THEMES
        end

        def outlined?
          outlined
        end

        def theme_css_class_prefix
          component_css_class
        end

        def default_theme
          :primary
        end

        def outline_css_class_string
          'outline-' if outlined?
        end
      end
    end
  end
end
