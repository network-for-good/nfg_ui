# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Nav Component
      # https://getbootstrap.com/docs/4.1/components/navs/
      class NavItem < Bootstrap::Components::Base
        include Bootstrap::Utilities::Wrappable

        def component_family
          :nav
        end

        private

        def default_html_wrapper_element
          :li
        end
      end
    end
  end
end
