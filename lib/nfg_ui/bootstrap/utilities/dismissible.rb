# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Delivers the dismissibility of the component to the HAML partial
      module Dismissible
        def dismissible
          options.fetch(:dismissible, default_dismissible)
        end

        private

        def non_html_attribute_options
          super.push(:dismissible)
        end

        def default_dismissible
          true
        end
      end
    end
  end
end
