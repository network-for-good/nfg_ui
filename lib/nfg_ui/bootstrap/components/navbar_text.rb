# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Navbar Component
      # https://getbootstrap.com/docs/4.1/components/navbar/
      class NavbarText < NfgUi::Bootstrap::Components::Base
        def component_family
          :navbar
        end

        private

        def base_element
          :span
        end
      end
    end
  end
end
