# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Base Component
      # Defines conventional, shared behavior across
      # Bootstrap components
      class Base
        attr_reader :headline, :body, :parent_component, :traits, :as
        attr_accessor :options

        def initialize(component_options)
          @options = defaults.merge!(component_options)
          @body = @options.fetch(:body, '')
          @headline = @options.fetch(:headline, '')
          @traits = @options.fetch(:traits, nil)
        end

        def html_options
          options.except(*non_html_attribute_options).merge!(class: css_classes, **assistive_html_attributes)
        end

        private

        def defaults
          {
            # HTML Defaults
            class: '',

            # Content
            headline: ('' if headline.present?),
            body: ('' if body.present?)
          }
        end

        # Assigned on individual components as needed
        # Ex: { role: 'alert' }
        def assistive_html_attributes
          { aria: aria_assistive_html_attributes }
        end

        # Fallback component css class name.
        # Overwritten within individual classes for situations like
        # Button's css class is 'btn'...
        # Example: returns 'alert' from NfgUi::Bootstrap::Components::Alert
        def component_css_class
          self.class.name.split('::').last.to_s.underscore.dasherize.downcase
        end

        def aria_assistive_html_attributes
          options.fetch(:aria, {})
        end

        def css_classes
          [component_css_class, trait_css_classes, options[:class]].join(' ').squish
        end

        def non_html_attribute_options
          %i[body headline traits]
        end

        def trait_css_classes
          ''
        end
      end
    end
  end
end
