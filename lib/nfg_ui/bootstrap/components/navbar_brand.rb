# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Navbar Component
      # https://getbootstrap.com/docs/4.1/components/navbar/
      class NavbarBrand < Bootstrap::Components::Base
        def component_family
          :navbar
        end

        def href
          options.fetch(:href, '#')
        end
      end
    end
  end
end
