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
        include NfgUi::Components::Elements::Tooltip

        attr_reader   :text
        attr_accessor :traits
        attr_writer   :icon, :right

        def initialize(*)
          super
          self.icon = traits.first.to_s
          self.right = options.fetch(:right) || traits.include?(:right)
          self.traits = (traits & allowed_traits) # only permissible traits are allowed
          @text = options.fetch(:text, default_text)
        end

        def right?
          right && allow_right?
        end

        private

        def allow_right?
          text.present?
        end

        def allowed_traits
          [:right]
        end

        def default_right
          false
        end

        def default_text
          ''
        end

        def css_classes
          right? ? super + ' ml-1' : super
        end

        def component_css_class
          nil
        end

        def defaults
          super.merge!(icon: '',
                       right: default_right,
                       text: '')
        end

        def non_html_attribute_options
          super.push(*icon_non_html_attribute_options)
        end

        def icon_non_html_attribute_options
          [(:text if text), (:right if right)].reject(&:nil?)
        end
      end
    end
  end
end
