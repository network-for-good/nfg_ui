# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Base Component
      # Defines conventional, shared behavior across
      # Bootstrap components
      class Base
        attr_reader :headline, :body, :parent_component
        attr_accessor :options

        def initialize(component_options)
          @options = defaults.merge(component_options)
          @body = @options.fetch(:body, '')
          @headline = @options.fetch(:headline, '')
        end

        def defaults
          {
            # HTML Defaults
            class: '',

            # Content
            headline: ('' if @headline.present?),
            body: ('' if @body.present?)
          }
        end

        def html_options
          @options.except(*non_html_attribute_options).merge(class: html_classes, **assistive_html_attributes)
        end

        private

        # Ex: { role: 'alert' }
        def assistive_html_attributes
          {}
        end

        # Fallback component css class name.
        # Example: returns 'alert' from NfgUi::Bootstrap::Components::Alert
        def component_html_class
          self.class.name.split('::').last.to_s.underscore.downcase
        end

        def html_classes
          [component_html_class, @options[:class]].join(' ')
        end

        def non_html_attribute_options
          %i[body headline]
        end
      end
    end
  end
end
