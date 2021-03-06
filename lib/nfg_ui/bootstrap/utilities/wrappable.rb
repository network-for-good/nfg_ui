# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows component to swap out the main component wrapping element (ex. :div vs. :span)
      # Pass in :as -- only unique logic at the moment
      # is converting :link to :a for tag generation
      module Wrappable
        attr_accessor :as

        def utility_initialize
          self.as = options.fetch(:as, automatic_as)
          super
        end

        private

        def assistive_html_attributes
          if as == :button
            super.merge(type: options.fetch(:type, 'button')) # prefer type submit
          else
            super
          end
        end

        def automatic_as
          if href
            :a
          elsif options[:type] == 'submit'
            :button
          else
            default_html_wrapper_element
          end
        end

        # Set default_html_wrapper_element on individual components as needed
        def default_html_wrapper_element
          @default_html_wrapper_element ||= :span
        end

        def non_html_attribute_options
          super.push(:as)
        end
      end
    end
  end
end
