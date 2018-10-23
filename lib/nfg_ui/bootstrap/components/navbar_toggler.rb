# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Navbar Component
      # https://getbootstrap.com/docs/4.1/components/navbar/
      class NavbarToggler < Bootstrap::Components::Base
        include Bootstrap::Utilities::Collapsible

        # Pass through to collapse component
        # def collapse
        #   options.fetch(:collapse, nil)
        # end

        def component_family
          :navbar
        end
      end
    end
  end
end
