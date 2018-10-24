# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows components to supply the dropDIRECTION for menus
      # This is applicable to more than just the Dropdown component
      module DropdownDirectionable
        def dropleft
          options.fetch(:dropleft, false)
        end

        def dropright
          options.fetch(:dropright, false)
        end

        def dropup
          options.fetch(:dropup, false)
        end

        private

        def css_classes
          [
            super,
            ('dropleft' if dropleft),
            ('dropright' if dropright),
            ('dropup' if dropup)
          ].join(' ').squish
        end

        def non_html_attribute_options
          super.push(:dropleft,
                     :dropright,
                     :dropup)
        end
      end
    end
  end
end
