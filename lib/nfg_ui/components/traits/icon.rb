# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Button traits
      module Icon
        include NfgUi::Components::Traits::Theme

        attr_reader :right, :text

        def initialize(*)
          super
          @right = options[:right] || traits.include?(:right)
        end

        def right?
          right && allow_right?
        end

        private

        def allow_right?
          text.present?
        end

        def allowed_traits
          [:right, *bootstrap4_themes]
        end

        def default_right
          false
        end

        def theme_css_class_prefix
          'text'
        end

        def css_classes
          right? ? super + ' ml-1' : super
        end

        def defaults
          super.merge!(right: default_right)
        end

        def icon_non_html_attribute_options
          super.push((:right if right?))
        end
      end
    end
  end
end
