module NfgUi
  module UI
    module Utilities
      # Centralizes initialization for the UI namespaces
      module Initializer
        attr_accessor :component,
                      :options,
                      :traits,
                      :component_name,
                      :class_name,
                      :view_context

        attr_reader :ancestry_string

        # Protect the component from outside manipulation
        # after initialization
        private :component=

        include ActionView::Helpers::CaptureHelper # add capture support, required for Haml
        include Haml::Helpers # add capture_haml support

        # Provides a central initialization method for NfgUi::UI::Base child classes
        def initializer(component_name = nil, *traits, **options, &block)
          # #init_haml_helpers is required when utilizing #capture with HAML
          # (when outside of Rails)
          # https://www.rubydoc.info/github/haml/haml/Haml%2FHelpers:init_haml_helpers
          init_haml_helpers
          @component_name = component_name
          @class_name = component_name.to_s.camelize
          @traits = traits
          @options = options
          options[:body] = capture(&block) if block_given?
          options[:traits] = traits.present? ? traits : []
          self.component = ancestry_string.constantize.new(options, view_context)
        end
      end
    end
  end
end
