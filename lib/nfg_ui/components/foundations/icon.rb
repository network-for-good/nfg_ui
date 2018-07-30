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
        # include Bootstrap::Utilities::Themeable
        # include Bootstrap::Utilities::Tooltipable
        # include NfgUi::Components::Traits::Icon

        # attr_accessor :icon, :text

        # def initialize(*)
        #   super
        #   self.icon = traits.first.to_s
        #   @text = options.fetch(:text, nil)
        # end

        # def right
        #   @right ||= options[:right]
        # end

        # private

        # def css_classes
        #   right ? super + ' ml-1' : super
        # end

        # def theme_css_class_prefix
        #   'text'
        # end

        # def component_css_class
        #   nil
        # end

        # def default_theme
        #   nil
        # end

        # def defaults
        #   super.merge!(icon: nil,
        #                text: nil,
        #                right: false)
        # end

        # def non_html_attribute_options
        #   super.push((:text if text))
        # end
      end
    end
  end
end
