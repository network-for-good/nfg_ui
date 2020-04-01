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


        # This base render handles many of the components and
        # can be changed to have a different base element by
        # overriding the base_element.
        # in some cases, the child component can also call
        # super with a block to have this render as the wrapping
        # element.
        def render
          content_tag(base_element, html_options) do
            (block_given? ? yield : body)
          end
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
          options.except(*non_html_attribute_options.uniq)
                 .merge!(id: id,
                         class: css_classes,
                         data: data,
                         href: href,
                         style: style,
                         **assistive_html_attributes)
                 .reject { |_k, v| v.blank? } # prevent empty attributes from showing up
                                              # Example: <div class>Text</div>
        end

        # Use view_context urL_for method to ensure that
        # when objects are passed into href, e.g.
        # `href: @admin` will convert it to the
        # correct path
        #
        # Likewise that hashes are also parsed correctly
        # example:
        # href: { controller: 'admin', action: 'show', id: 7 }
        def href
          return if options[:href].nil?
          view_context.url_for(options[:href])
        end

        def id
          options[:id]
        end

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

        # For components that inherit bootstrap, provide a second
        # layer of initialization, for example:
        # to initialize traits on design system components
        # (which are not available on bootstrap)
        def component_initialize; end
        def utility_initialize; end

        # the base_element is used in the default render for all components
        # as the outer wrapping element. Typically, this is a div, but
        # can be overriddent as a different static element in a child class
        # or as a dynamic element in the child class.
        # this allows most child components to not have to have their
        # own render statement if their wrapping element is not a div
        def base_element
          :div
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
          @css_classes ||= [component_css_class, options[:class]].reject(&:nil?).uniq.join(' ').squish
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
