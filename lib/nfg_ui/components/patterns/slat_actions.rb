# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Slat doc coming soon
      class SlatActions < NfgUi::Components::Base
        include Bootstrap::Utilities::Themeable

        include NfgUi::Components::Utilities::Iconable

        include NfgUi::Components::Traits::Theme

        def component_family
          :slats
        end

        def menu
          options.fetch(:menu, true)
        end

        def slat_header
          options.fetch(:slat_header, false)
        end

        def wide
          options.fetch(:wide, true)
        end

        private

        def default_theme
          nil
        end

        def theme_css_class_prefix
          'text-'
        end

        def outlineable?
          false
        end

        def css_classes
          [
            super,
            ("#{component_css_class}-sm" unless wide)
          ]
        end

        def non_html_attribute_options
          super.push(:slat_header, :wide, :menu)
        end
      end
    end
  end
end
