# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows component to utilize the bootstrap4 theme color palette
      module Themeable
        def outlined
          options.fetch(:outlined, false)
        end

        # To disable theme on a case by case basis, pass in { theme: nil } to options.
        # or
        # To disable a default theme for a component set default_theme to nil
        def theme
          options.fetch(:theme, default_theme)
        end

        private

        def css_classes
          [
            super,
            ("#{theme_css_class_prefix}#{outlined_css_class_prefix if outlined}#{theme}" if theme)
          ].join(' ').squish
        end

        def default_theme
          @default_theme ||= NfgUi::DEFAULT_BOOTSTRAP_THEME
        end

        def non_html_attribute_options
          super.push(:theme, :outlined)
        end

        def outlined_css_class_prefix
          @outlined_css_class_prefix ||= 'outline-'
        end

        def theme_css_class_prefix
          @theme_css_class_prefix ||= "#{component_css_class}-"
        end
      end
    end
  end
end
