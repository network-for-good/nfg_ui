# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows component to utilize the bootstrap4 theme color palette
      module Themeable
        # attr_reader :theme, :outlined
        # attr_accessor :theme
        
        # pass in options: { theme: nil } to disable themes or set default_theme to nil
        # for components that are themeable that, for whatever reason,
        # need a theme removed (example: the modal 'close' button)
        def theme
          options.fetch(:theme, default_theme)
        end

        def outlined
          options.fetch(:outlined, false)
        end

        private

        def css_classes
          return super unless theme.present?
          super + " #{theme_css_class_prefix}#{outlined_css_class_prefix if outlined}#{theme}"
        end

        def non_html_attribute_options
          super.push(:theme, :outlined)
        end

        def theme_css_class_prefix
          @theme_css_class_prefix ||= "#{component_css_class}-"
        end

        def default_theme
          @default_theme ||= NfgUi::DEFAULT_BOOTSTRAP_THEME
        end

        def outlined_css_class_prefix
          @outlined_css_class_prefix ||= 'outline-'
        end
      end
    end
  end
end
