# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Navbar Component
      # https://getbootstrap.com/docs/4.1/components/navbar/
      class NavbarBrand < NfgUi::Bootstrap::Components::Base
        def component_family
          :navbar
        end

        def href
          super || '#'
        end

        private

        def base_element
          :a
        end
      end
    end
  end
end
