# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows component to swap out the main component wrapping element (ex. :div vs. :span)
      # Pass in :as -- only unique logic at the moment
      # is converting :link to :a for tag generation
      module Wrappable
        attr_accessor :as

        def initialize(component_options)
          super
          self.as = options.fetch(:as, default_html_wrapper_element)
        end

        def html_wrapper_element
          link? ? :a : as
        end

        private

        # # UPDATING DEFAULTS FROM LINK_DEFAULTS DOES NOT WORK YET
        def defaults
          super.merge!(link_defaults)
        end

        def link_defaults
          link? ? { href: 'javascripts:;' } : {}
        end

        def default_html_wrapper_element
          :a
        end

        def non_html_attribute_options
          super.push(:as)
        end

        def link?
          as == :link
        end
      end
    end
  end
end
