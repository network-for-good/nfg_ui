# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Navbar Component
      # https://getbootstrap.com/docs/4.1/components/navbar/
      class NavbarNav < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Wrappable

        def component_family
          :navbar
        end

        def right
          options.fetch(:right, false)
        end

        # Left by default
        def left
          options.fetch(:left, default_left)
        end

        private

        def css_classes
          [
            super,
            ('ml-auto' if right),
            ('mr-auto' if left)
          ].join(' ').squish
        end

        def default_html_wrapper_element
          :ul
        end

        def default_left
          right ? false : true
        end
      end
    end
  end
end
