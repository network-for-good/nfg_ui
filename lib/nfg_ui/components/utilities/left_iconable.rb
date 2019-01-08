# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # Allows components to be setup to accept left icons
      # Pass in a text value to identify the correct icon to be placed
      # on the left side of the component.
      module LeftIconable
        def left_icon
          options.fetch(:left_icon, nil)
        end

        private

        def non_html_attribute_options
          super.push(:left_icon)
        end
      end
    end
  end
end
