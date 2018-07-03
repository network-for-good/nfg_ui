# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows components to have a disabled state when appropriate
      module Disableable
        attr_accessor :disabled

        def initialize(component_options)
          super
          self.disabled = options.fetch(:disabled, default_disabled)
        end

        def disabled?
          disabled
        end

        private

        def css_classes
          disabled? ? super + ' disabled' : super
        end

        def non_html_attribute_options
          if elements_permitted_to_have_disabled_attribute.include?(as)
            super
          else
            super.push(:disabled)
          end
        end

        def elements_permitted_to_have_disabled_attribute
          %i[button
             input]
        end

        def default_disabled
          false
        end
      end
    end
  end
end
