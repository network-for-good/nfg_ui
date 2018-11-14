# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # Allows components to be setup to accept method: options
      module Methodable
        def method
          options.fetch(:method, nil)
        end

        def data
          send(:method) ? super.merge!(method: send(:method)) : super
        end

        private

        def non_html_attribute_options
          super.push(:method)
        end
      end
    end
  end
end
