# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Applies ability to modify the component's size
      # Pass in :lg or :sm
      module Sizable
        def size
          options.fetch(:size, nil)
        end

        private

        def css_classes
          [
            super,
            (size_css_class if resized?)
          ].join(' ').squish
        end

        def non_html_attribute_options
          super.push(:size)
        end

        def resized?
          size == :sm || size == :lg
        end

        def size_css_class
          "#{size_css_class_prefix}-#{size}"
        end

        def size_css_class_prefix
          @size_css_class_prefix ||= component_css_class
        end
      end
    end
  end
end
