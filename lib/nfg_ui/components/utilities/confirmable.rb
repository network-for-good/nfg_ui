# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # Allows components to be setup to accept method: options
      module Confirmable
        def confirm
          options.fetch(:confirm, nil)
        end

        def data
          confirm ? super.merge!(confirm: confirm) : super
        end

        private

        def non_html_attribute_options
          super.push(:confirm)
        end
      end
    end
  end
end
