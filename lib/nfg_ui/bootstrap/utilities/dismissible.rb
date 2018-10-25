# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Delivers the dismissibility of the component to the HAML partial
      module Dismissible
        # attr_accessor :dismissible

        # def initialize(*)
        #   super
        #   self.dismissible = options.fetch(:dismissible, default_dismissible)
        # end

        def dismissible
          options.fetch(:dismissible, default_dismissible)
        end
        
        def dismissible?
          dismissible
        end

        private

        # def defaults
        #   super.merge(dismissible: default_dismissible)
        # end

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
