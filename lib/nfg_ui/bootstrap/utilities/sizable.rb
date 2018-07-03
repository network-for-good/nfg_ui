# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Applies ability to modify the component's size
      # Pass in :lg or :sm
      module Sizable
        attr_accessor :size

        def initialize(component_options)
          super
          self.size = component_options.fetch(:size, default_size)
        end

        def defaults
          super.merge(size: default_size)
        end

        def css_classes
          [super, size_css_class].join(' ')
        end

        def non_html_attribute_options
          super.push(:size)
        end

        def size_css_class
          bootstrap4_size_options.include?(size) ? "#{component_css_class}-#{size}" : ''
        end

        private

        def bootstrap4_size_options
          %i[sm lg]
        end

        def default_size
          nil
        end
      end
    end
  end
end
