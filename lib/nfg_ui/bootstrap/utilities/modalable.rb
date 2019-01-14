# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Delivers the dismissibility of the component to the HAML partial
      module Modalable
        def modal
          options.fetch(:modal, nil)
        end

        def data
          modal ? super.merge!(toggle: 'modal', target: options[:modal]) : super
        end

        private

        def non_html_attribute_options
          super.push(:modal)
        end
      end
    end
  end
end
