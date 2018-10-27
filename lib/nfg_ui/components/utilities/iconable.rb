# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # Allows components to be setup to accept icons
      module Iconable
        def icon
          options.fetch(:icon, nil)
        end

        private

        def non_html_attribute_options
          super.push(:icon, :text)
        end
      end
    end
  end
end
