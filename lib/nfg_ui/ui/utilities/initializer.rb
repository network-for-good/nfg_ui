# frozen_string_literal: true

module NfgUi
  module UI
    module Utilities
      # Centralizes initialization for the UI namespaces
      module Initializer
        attr_accessor :component,
                      :options,
                      :traits,
                      :component_name,
                      :class_name
                      

        # attr_reader :ancestry_string

        # Protect the component from outside manipulation
        # after initialization
        private :component=

        include ActionView::Helpers::CaptureHelper # add capture support, required for Haml
        include Haml::Helpers # add capture_haml support

        def render_component
          p "====== Printed from: (Utilities::Initializer) self.class.name: #{self.class.name} method: #{__method__}"
          view_context.render partial: partial_path, locals: { component_name => component }
        end

        
        private

        # Provides a central initialization method for NfgUi::UI::Base child classes
        def initializer(component_name = nil, *traits, **options, &block)
          p "====== Printed from: (Utilities::Initializer) self.class.name: #{self.class.name} method: #{__method__}"
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
          
          # self.view_context = view_context
          self.component = ancestry_string.constantize.new(options, view_context)
        end

        def ancestry_string
          p "====== Printed from: (Utilities::Initializer) self.class.name: #{self.class.name} method: #{__method__}"
          ''
        end

        # def component_name_folder
        #   @component_name_folder ||= ''
        # end

        def component_family
          p "====== Printed from: (Utilities::Initializer) self.class.name: #{self.class.name} method: #{__method__}"
          component.component_family.presence
        end

        def grouping_folder
          p "====== Printed from: (Utilities::Initializer) self.class.name: #{self.class.name} method: #{__method__}"
          ''
        end

        def group; end

        def components_within_group(*)
          p "====== Printed from: (Utilities::Initializer) self.class.name: #{self.class.name} method: #{__method__}"
          []
        end

        def partial_path
          p "====== Printed from: (Utilities::Initializer) self.class.name: #{self.class.name} method: #{__method__}"
          [
            'nfg_ui',
            grouping_folder,
            (component_name_folder if component_name_folder.present?),
            component_name
          ].reject(&:nil?).join('/').chomp
        end
      end
    end
  end
end
