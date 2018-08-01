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
          p "====== (Bootstrap::Utilities::Dismissible) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:dismissible, default_dismissible)
        end
        
        def dismissible?
          p "====== (Bootstrap::Utilities::Dismissible) self.class.name: #{self.class.name} method: #{__method__}"
          dismissible
        end

        private

        # def defaults
        #   super.merge(dismissible: default_dismissible)
        # end

        def non_html_attribute_options
          p "====== (Bootstrap::Utilities::Dismissible) self.class.name: #{self.class.name} method: #{__method__}"
          super.push(:dismissible)
        end

        def default_dismissible
          p "====== (Bootstrap::Utilities::Dismissible) self.class.name: #{self.class.name} method: #{__method__}"
          true
        end
      end
    end
  end
end
