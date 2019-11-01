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

        # Utilize a trait or `:icon` within options.
        # When setting the icon as a trait, you must pass in a string.
        # If a symbol is detected, the component assumes it's a registered trait
        #
        # Example usage as a trait:
        # = ui.nfg :icon, 'heart'
        #
        # Example usage as an option:
        # = ui.nfg :icon, icon: 'heart'
        #
        # This is useful in syncing up the ability to pass in `:icon` to
        # components that accept `:icon` in options and automatically render an icon.
        def icon
          options[:icon] || (traits.slice!(0).to_s if traits.first.is_a?(String))
        end

        # Outputs a Font Awesome icon using the #fa_icon method.
        def render
          view_context.fa_icon icon, **html_options, text: text, right: right
        end

        # Tap into the font_awesome_rails :right method to
        # place the icon on the right side of the text.
        # This also automatically adds the right side css spacer class to the icon <i> tag.
        def right
          options.fetch(:right, false)
        end

        # Tap into the font_awesome_rails :text method to
        # insert text into the rendered component.
        def text
          options.fetch(:text, nil)
        end

        private

        # Adds the left css spacer class when :right is false
        # and when text is present
        def add_left_icon_css_spacer_class?
          return false if reject_spacer_class?
          !right && text.present?
        end

        # Adds the left css spacer class when :right is true
        # and when text is present
        def add_right_icon_css_spacer_class?
          return false if reject_spacer_class?
          right && text.present?
        end

        def assistive_html_attributes
          super.merge(aria: { hidden: true })
        end

        # Override the auto generated css class
        def component_css_class
          ''
        end

        # Icons utilize "spacer" css classes to manually provide margins
        # between the icon and the text.
        def css_classes
          [
            super,
            (NfgUi::Components::Foundations::Icon::LEFT_ICON_SPACER_CSS_CLASS if add_left_icon_css_spacer_class?),
            (NfgUi::Components::Foundations::Icon::RIGHT_ICON_SPACER_CSS_CLASS if add_right_icon_css_spacer_class?)
          ].join(' ').squish
        end

        # Icons utilize text styling for css theming.
        def theme_css_class_prefix
          'text-'
        end

        # Icons should be body text color by default and should not
        # have a theme set by default.
        def default_theme
          nil
        end

        def non_html_attribute_options
          super.push(:right, :text, :icon)
        end

        # Icons are not thematically outlineable
        def outlineable?
          false
        end

        # List of unique conditions that will result in
        # full rejection of left/right spacer classes
        #
        # This is needed for specific traits / design system approaches
        # Where icons get unique css classes based on
        # their context, such as a :tip icon which is
        # placed in the sentence flow and doesn't need left/right css spacers.
        def reject_spacer_class?
          traits.include?(:tip)
        end
      end
    end
  end
end
