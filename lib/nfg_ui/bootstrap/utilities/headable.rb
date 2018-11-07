# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Delivers the dismissibility of the component to the HAML partial
      module Headable
        def heading
          options.fetch(:heading, nil)
        end

        private

        def non_html_attribute_options
          super.push(:heading)
        end
      end
    end
  end
end
