# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Navbar Component
      # https://getbootstrap.com/docs/4.1/components/navbar/
      class Navbar < Bootstrap::Components::Base
        include Bootstrap::Utilities::Wrappable
        
        def component_family
          :navbar
        end

        private

        def assistive_html_attributes
          as == :nav ? super : super.merge!(role: 'navigation')
        end

        def default_html_wrapper_element
          :nav
        end
      end
    end
  end
end
