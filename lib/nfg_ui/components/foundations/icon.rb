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

        attr_reader   :text
        attr_accessor :icon
        attr_writer   :traits

        def initialize(*)
          super
          self.icon = traits.first.to_s
          self.traits = (traits & allowed_traits) # only permissible traits are allowed
          @text = options.fetch(:text, default_text)
        end

        private

        def default_text
          ''
        end

        def component_css_class
          nil
        end

        def defaults
          super.merge!(icon: '',
                       text: '')
        end

        def non_html_attribute_options
          super.push(*icon_non_html_attribute_options)
        end

        def icon_non_html_attribute_options
          text ? [:text] : []
        end
      end
    end
  end
end
