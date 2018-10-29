# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows component to swap out the main component wrapping element (ex. :div vs. :span)
      # Pass in :as -- only unique logic at the moment
      # is converting :link to :a for tag generation
      module Wrappable
        def as
          options.fetch(:as, automatic_as)
        end

        private

        def automatic_as
          if href.present?
            :a
          elsif options[:type] == 'submit'
            :button
          else
            default_html_wrapper_element
          end
        end

        def non_html_attribute_options
          super.push(:as)
        end

        # Set default_html_wrapper_element on individual components as needed
        def default_html_wrapper_element
          @default_html_wrapper_element ||= :span
        end

        def assistive_html_attributes
          if as == :button
            super.merge(type: options.fetch(:type, 'button')) # prefer type submit
          else
            super
          end
          # as == :button ? super.merge!(type: 'button') : super
        end
      end
    end
  end
end
