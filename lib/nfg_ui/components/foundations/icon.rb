# frozen_string_literal: true

module NfgUi
  module Components
    module Foundations
      # Icon doc coming soon
      # Implementation and usage is designed to mimic the font_awesome_rails gem
      #
      # Example usage:
      # = ui.nfg :icon, 'rocket', :right, text: 'Example text with icon on the right'
      class Icon < NfgUi::Components::Base
        include Bootstrap::Utilities::Themeable
        include Bootstrap::Utilities::Tooltipable

        include NfgUi::Components::Traits::Icon
        include NfgUi::Components::Traits::Muted
        include NfgUi::Components::Traits::Theme
        include NfgUi::Components::Traits::Alignment

        # Officially declare the icon spacer classes
        # so that other iconable components that have more than one icon
        # e.g.: :left_icon & :icon can use the spacer class manually
        LEFT_ICON_SPACER_CSS_CLASS  = 'mr-1'
        RIGHT_ICON_SPACER_CSS_CLASS = 'ml-1'

        def render
          view_context.fa_icon icon, **html_options, text: text, right: right
        end

        def icon
          options[:icon] || (traits.slice!(0).to_s if traits.first.is_a?(String))
        end

        def text
          options.fetch(:text, nil)
        end

        def right
          options.fetch(:right, false)
        end

        private

        def css_classes
          return super unless text
          [
            super,
            (LEFT_ICON_SPACER_CSS_CLASS unless right),
            (RIGHT_ICON_SPACER_CSS_CLASS if right)
          ].join(' ').squish
        end

        def theme_css_class_prefix
          'text-'
        end

        def component_css_class
          ''
        end

        def default_theme
          nil
        end

        def non_html_attribute_options
          super.push(:right, :text, :icon)
        end

        def outlineable?
          false
        end
      end
    end
  end
end
