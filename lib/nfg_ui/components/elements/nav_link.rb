# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Nav doc coming soon
      class NavLink < NfgUi::Bootstrap::Components::NavLink
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Active
        include NfgUi::Components::Traits::Remote
        include NfgUi::Components::Traits::Disable

        def render
          if dropdown
            NfgUi::Components::Elements::DropdownToggle.new({ body: (block_given? ? yield : body), as: :a, **html_options, theme: nil, nav_link: true }, view_context).render
          else
            content_tag(:a, html_options) do
              if icon
                NfgUi::Components::Foundations::Icon.new({ traits: [icon], text: (block_given? ? yield : body) }, view_context).render
              else
                (block_given? ? yield : body)
              end
            end
          end
        end
      end
    end
  end
end
