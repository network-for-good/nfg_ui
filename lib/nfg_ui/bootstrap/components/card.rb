# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Card Component
      # https://getbootstrap.com/docs/4.1/components/cards/
      class Card < Bootstrap::Components::Base
        include Bootstrap::Utilities::Themeable

        def component_family
          :card
        end

        def footer
          options.fetch(:footer, '')
        end

        def heading
          options.fetch(:heading, '')
        end

        def subtitle
          options.fetch(:subtitle, '')
        end

        def title
          options.fetch(:title, '')
        end

        private

        def css_classes
          return super unless theme.presence && theme != :light
          [
            super,
            (outlined ? "text-#{theme}" : 'text-white')
          ].join(' ').squish
        end

        def default_theme
          nil
        end

        def non_html_attribute_options
          super.push(:footer, :heading, :subtitle, :title)
        end

        def outlined_css_class_prefix
          'border-'
        end

        def theme_css_class_prefix
          outlined ? '' : 'bg-'
        end
      end
    end
  end
end
