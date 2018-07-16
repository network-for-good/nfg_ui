# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows component to swap out the main component wrapping element (ex. :div vs. :span)
      # Pass in :as -- only unique logic at the moment
      # is converting :link to :a for tag generation
      module Wrappable
        attr_reader :href
        attr_writer :as, :options

        def initialize(component_options, *)
          super
          self.as = options.fetch(:as, assigned_html_wrapper_element)
          self.options = defaults.merge!(**defaults_for_link, **options) if link?
          @href = options.try(:href, nil)
        end

        def html_wrapper_element
          as_link? ? :a : as
        end

        private

        def assistive_html_attributes
          as == :button && super[:type].nil? ? super.merge(type: 'button') : super
        end

        def non_html_attribute_options
          super.push(:as)
        end

        def as_link?
          as == :link
        end

        def assigned_html_wrapper_element
          href ? :a : default_html_wrapper_element
        end

        # Set default_html_wrapper_element on individual components as needed
        def default_html_wrapper_element
          :span
        end

        def link?
          html_wrapper_element == :a
        end

        def defaults_for_link
          { href: 'javascript:;' }
        end
      end
    end
  end
end
