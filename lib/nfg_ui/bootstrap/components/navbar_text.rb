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

        def render
          content_tag(:span, html_options) do
            (block_given? ? yield : body)
          end
        end
      end
    end
  end
end
