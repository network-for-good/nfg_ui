# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Nav Component
      # https://getbootstrap.com/docs/4.1/components/navs/
      class NavLink < Bootstrap::Components::Base
        def component_family
          :nav
        end
      end
    end
  end
end
