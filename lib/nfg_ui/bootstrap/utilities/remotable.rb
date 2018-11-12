# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Turns remote: true functionality on for components that need it.
      module Remotable
        def data
          remote ? super.merge!(remote: 'true') : super
        end

        def remote
          options.fetch(:remote, false)
        end

        private

        def non_html_attribute_options
          super.push(:remote)
        end
      end
    end
  end
end
