# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows components to have a disabled state when appropriate
      module Disableable
        attr_reader :as

        def disabled
          options.fetch(:disabled, false)
        end

        private

        def css_classes
          # when the tag does not take a disabled attribute we
          # assigne the disabled class
          [
            super,
            ('disabled' if disabled && !tag_allows_for_disable_attribute?)
          ].join(' ').squish
        end

        def non_html_attribute_options
          # if tag accepts the disabled attribute
          # push it through, otherwise remove it from the
          # html options. We do this regardless of whether or not
          # disabled was actually set to ensure that those
          # tags that can't take a disabled option never receive it
          tag_allows_for_disable_attribute? ? super : super.push(:disabled)
        end

        def assistive_html_attributes
          if disabled
            super.merge!(tabindex: '-1',
                         **(tag_allows_for_disable_attribute?) ? { disabled: true } : {})
          else
            super
          end
        end

        def tag_allows_for_disable_attribute?
          [:button, :input, :fieldset, :optgroup, :option, :select, :textarea].include?(as)
        end
      end
    end
  end
end
