# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # Allows NFG design system components to utilize the :title option
      module Titleable
        def title
          options.fetch(:title, nil)
        end

        private

        def non_html_attribute_options
          super.push(:title)
        end
      end
    end
  end
end
