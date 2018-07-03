# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows components to have a disabled state when appropriate
      module Disableable
        attr_accessor :disabled

        def initialize(component_options)
          super
          self.disabled = component_options.fetch(:disabled, default_disabled)
        end

        def disabled?
          disabled
        end

        private

        def css_classes
          [super, ('disabled' if disabled?)].join(' ').squish
        end

        def non_html_attribute_options
          if as && as == :button
            super
          else
            super.push(:disabled)
          end
        end

        def default_disabled
          false
        end
      end
    end
  end
end
