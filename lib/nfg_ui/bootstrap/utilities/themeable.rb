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

          theme_not_present_error if theme_not_present_error?
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
          "#{theme_css_class_prefix}-#{outline_css_class_string}#{theme}"
        end

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

        def outlined?
          outlined
        end

        def theme_css_class_prefix
          component_css_class
        end

        def default_theme
          :primary
        end

        def theme_not_present_error?
          !bootstrap4_themes.include?(theme)
        end

        def theme_not_present_error
          raise ArgumentError.new "#{self.class.name} passed in a theme (:#{theme}) that was not recognized as a bootstrap theme.\n\nBootstrap4 theme options are:\n:#{bootstrap4_themes.join("\n\:")}"
        end

        def outline_css_class_string
          'outline-' if outlined?
        end
      end
    end
  end
end
