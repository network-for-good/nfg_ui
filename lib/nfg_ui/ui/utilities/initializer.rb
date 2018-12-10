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

        # Protect the component from outside manipulation
        # after initialization
        private :component=

        def render_component
          component.render
        rescue NotImplementedError
          view_context.render partial: partial_path, locals: { component_name => component }
        end

        private

        def render_if
          options.fetch(:render_if, true)
        end

        def render_unless
          options.fetch(:render_unless, true)
        end

        # Provides a central initialization method for NfgUi::UI::Base child classes
        def initializer(component_name = nil, *traits, **options, &block)
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
          ''
        end

        # def component_name_folder
        #   @component_name_folder ||= ''
        # end

        def component_family
          component.component_family.presence
        end

        def components_within_group(*)
          []
        end

        def grouping_folder
          ''
        end

        def group; end

        def partial_path
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
