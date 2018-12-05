# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Navbar Component
      # https://getbootstrap.com/docs/4.1/components/navbar/
      class NavbarToggler < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::CollapseToggleable

        # Pass through to collapse component
        # def collapse
        #   options.fetch(:collapse, nil)
        # end

        def component_family
          :navbar
        end

        def render
          super do
            if body
              (block_given? ? yield : body)
            else
              content_tag(:span, nil, class: 'navbar-toggler-icon')
            end
          end
        end

        private

        def base_element
          :button
        end
      end
    end
  end
end
