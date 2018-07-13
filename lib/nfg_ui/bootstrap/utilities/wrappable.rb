# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows component to swap out the main component wrapping element (ex. :div vs. :span)
      # Pass in :as -- only unique logic at the moment
      # is converting :link to :a for tag generation
      module Wrappable
        attr_reader :default_html_wrapper_element
        attr_writer :as, :options

        def initialize(component_options, *)
          super
          self.as = options.fetch(:as, as_becomes_link) || default_html_wrapper_element
          self.options = defaults.merge!(**default_link, **options) if link?

          default_html_wrapper_element_error if default_html_wrapper_element_error?
          as_competes_with_href_error if as_competes_with_href?
        end

        def html_wrapper_element
          as_link? ? :a : as
        end

        private

        def assistive_html_attributes
          as == :button && super[:type].nil? ? super.merge(type: 'button') : super
        end

        def as_becomes_link
          :a if options.try(:href)
        end

        def non_html_attribute_options
          super.push(:as)
        end

        def as_link?
          as == :link
        end

        def link?
          html_wrapper_element == :a
        end

        def default_link
          { href: 'javascript:;' }
        end

        def as_competes_with_href?
          (options[:href].present? && !link?)
        end

        def as_competes_with_href_error
          raise ArgumentError.new "#{self.class.name} passed in :#{as} but also passed in an :href. Only pass in an :href if you're using a link. You may pass in an href without an :as option to generate a link.
Example of incorrect usage (note that this attempts to inject an href into a <button>):
= ui.nfg :button, as: :button, href: 'http://google.com', body: 'Button'

Example of correct usage:
= ui.nfg :button, body: 'Button', href: 'http://google.com'

or, explicitly state that this component is a link

= ui.nfg :button, as: :a, body: 'Button', href: 'http://google.com'
= ui.nfg :button, as: :link, body: 'Button', href: 'http://google.com'
          "
        end

        def default_html_wrapper_element_error?
          default_html_wrapper_element.nil?
        end

        def default_html_wrapper_element_error
          raise ArgumentError.new "#{self.class.name} is expected to define a #default_html_wrapper_element\n\nExample:\n
class #{self.class.name} < Bootstrap::Components::Base
  def default_html_wrapper_element
    :a
  end
end"
        end
      end
    end
  end
end
