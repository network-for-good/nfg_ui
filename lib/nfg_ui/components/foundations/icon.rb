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

        def icon
          options[:icon] = options[:icon] || (traits.slice!(0).to_s if traits.first.is_a?(String))
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
            ('mr-1' unless right),
            ('ml-1' if right)
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
