# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Delivers the dismissibility of the component to the HAML partial
      module Dismissible
        attr_accessor :dismissible

        def initialize(component_options)
          super
          self.dismissible = component_options.fetch(:dismissible, default_dismissible)
        end

        def dismissible?
          dismissible
        end

        def defaults
          super.merge(dismissible: default_dismissible)
        end

        def non_html_attribute_options
          super.push(:dismissible)
        end

        private

        def default_dismissible
          true
        end
      end
    end
  end
end
