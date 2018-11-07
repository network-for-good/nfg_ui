# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows components to have a disabled state when appropriate
      module Disableable
        attr_reader :as

        def disabled
          options.fetch(:disabled, false)
        end

        private

        def css_classes
          return super if as == :button
          disabled ? super + ' disabled' : super
        end

        def non_html_attribute_options
          as == :button ? super : super.push(:disabled)
        end

        def assistive_html_attributes
          if disabled
            super.merge!(tabindex: '-1',
                         **(as == :button) ? { disabled: true } : {})
            
          else
            super
          end
        end
      end
    end
  end
end
