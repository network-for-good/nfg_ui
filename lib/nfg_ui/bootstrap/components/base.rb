# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Base Component
      # Defines conventional, shared behavior across
      # Bootstrap components
      class Base
        include ActionView::Helpers::TagHelper
        include ActionView::Helpers::TextHelper
        include ActionView::Helpers::AssetTagHelper
        include ActionView::Context

        attr_reader   :body

        attr_accessor :options,
                      :view_context

        def initialize(component_options, view_context)
          self.options = defaults.merge!(component_options)
          self.view_context = view_context
          @body = options.fetch(:body, '')
          utility_initialize
          component_initialize
        end

        def render
          # Until a component has it's own render method, this NotImplemented
          # error will be raised, and the components related partial will be rendered
          #
          # Remember to always include  (block_given? ? yield : body) where the original
          # component.body was rendered, so each componenets render method can accept
          # a block, or continue to accept the body value
          raise NotImplementedError.new("a subclass must implement this")
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

        def data
          options[:data] || {}
        end

        def html_options
          options.except(*non_html_attribute_options)
                 .merge!(id: id,
                         class: css_classes,
                         data: data,
                         href: href,
                         style: style,
                         **assistive_html_attributes)
                 .reject { |_k, v| v.blank? } # prevent empty attributes from showing up
                                              # Example: <div class>Text</div>
        end

        def href
          options[:href]
        end

        def id
          options[:id]
        end

        # For components that inherit bootstrap, provide a second
        # layer of initialization, for example:
        # to initialize traits on design system components
        # (which are not available on bootstrap)
        def component_initialize; end
        def utility_initialize; end

        def style
          options[:style]
        end

        private

        # Assigned on individual components as needed
        # Ex: { role: 'alert' }
        #
        # If aria assistive html is needed, see:
        # Bootstrap::Utilities::AriaAssistable
        # avoid passing aria to assistive_html_attributes directly
        def assistive_html_attributes
          @assistive_html_attributes ||= {}
        end

        # Fallback component css class name.
        # Overwritten within individual classes for situations like
        # Button's css class is 'btn'...
        # Example: returns 'alert' from NfgUi::Bootstrap::Components::Alert
        def component_css_class
          @component_css_class ||= component_class_name_string.underscore.dasherize.downcase
        end

        def component_class_name_string
          self.class.name.demodulize.to_s
        end

        # Manage or adjust the css_classes of the component by
        # adding a new string of css classes to this method
        # ex: super.push('new-class')
        def css_classes
          @css_classes ||= [component_css_class, options[:class]].join(' ').squish
        end

        def defaults
          {
            # HTML Defaults
            class: '',
            id: nil,

            # Content
            # heading: (nil if heading.present?),
            body: nil,
            data: {},

            # Configuration
            # traits: ([] if traits.present?)
          }
        end
        # Remove attributes from html_options that shouldn't show up in the
        # html element, ex: <div body='should not be here'>
        def non_html_attribute_options
          @non_html_attribute_options ||= %i[body heading traits]
        end
      end
    end
  end
end
