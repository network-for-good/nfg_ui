# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Alert Component
      # https://getbootstrap.com/docs/4.1/components/alerts/
      class Card < Bootstrap::Components::Base
        include Bootstrap::Utilities::Themeable

        attr_reader :subtitle
        attr_writer :options

        def initialize(*)
          super
          @subtitle = options.fetch(:subtitle, '')
          self.options = defaults.merge!(**defaults_for_subtitle, **options) if subtitle.present?
        end

        def card_title_element
          :h5
        end

        def card_subtitle_element
          :h6
        end

        def component_family
          :card
        end

        private

        def card_theme_text_css_class
          if outlined?
            "text-#{theme}" unless theme == :light
          elsif theme != :light
            'text-white'
          else
            ''
          end
        end

        def defaults_for_subtitle
          { subtitle: '' }
        end

        def default_theme
          nil
        end

        def non_html_attribute_options
          super.push(:subtitle)
        end

        def outline_css_class_string
          'border-' if outlined?
        end

        def theme_css_class
          if theme.present?
            if outlined?
              "#{outline_css_class_string}#{theme} #{card_theme_text_css_class}"
            else
              super + " #{card_theme_text_css_class}"
            end
          else
            super
          end
        end

        def theme_css_class_prefix
          'bg'
        end
      end
    end
  end
end
