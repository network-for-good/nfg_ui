# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Base Component
      # Defines conventional, shared behavior across
      # Bootstrap components
      class Base
        attr_reader :headline, :body, :component_family, :traits, :as
        attr_accessor :options

        def initialize(component_options)
          @options = defaults.merge!(component_options)
          @body = options.fetch(:body, '')
          @headline = options.fetch(:headline, '')
          @traits = options.fetch(:traits, nil)
        end

        def html_options
          options.except(*non_html_attribute_options).merge!(class: css_classes, **assistive_html_attributes)
        end

        # This is used to help identify where to find partials for rendering components.
        #
        # Set the component family, e.g.: :breadcrumb
        # on any sibling components.
        #
        # For example:
        # BreadcrumbItem & Breadcrumb are members of the :breadcrumb component_family
        def component_family
          nil
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
        #
        # If aria assistive html is needed, see:
        # Bootstrap::Utilities::AriaAssistable
        # avoid passing aria to assistive_html_attributes directly
        def assistive_html_attributes
          {}
        end

        # Fallback component css class name.
        # Overwritten within individual classes for situations like
        # Button's css class is 'btn'...
        # Example: returns 'alert' from NfgUi::Bootstrap::Components::Alert
        def component_css_class
          self.class.name.split('::').last.to_s.underscore.dasherize.downcase
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
