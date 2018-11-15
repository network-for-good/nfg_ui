# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allow components to be right and center aligned
      module Alignable
        def center
          options.fetch(:center, false)
        end

        def right
          options.fetch(:right, false)
        end

        private

        def css_classes
          [
            super,
            ('justify-content-center' if center),
            ('justify-content-end' if right)
          ].join(' ').squish
        end

        def non_html_attribute_options
          super.push(:right,
                     :center)
        end
      end
    end
  end
end
