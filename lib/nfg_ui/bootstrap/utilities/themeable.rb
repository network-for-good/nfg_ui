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

        # def initialize(*)
        #   super
        #   @theme = options.fetch(:theme, default_theme)
        #   @outlined = options.fetch(:outlined, traits.include?(:outlined))
        # end

        private

        # def defaults
        #   super.merge!(theme: default_theme)
        # end

        def css_classes
          return super unless theme.present?
          super + " #{component_css_class}-#{outlined_prefix}#{theme}"
        end

        def non_html_attribute_options
          super.push(:theme, :outlined)
        end

        # def bootstrap4_themes
        #   NfgUi::BOOTSTRAP_THEMES
        # end

        def outlined?
          outlined
        end

        def default_theme
          @default_theme ||= :primary
        end

        def outlined_prefix
          'outline-' if outlined?
        end
      end
    end
  end
end
