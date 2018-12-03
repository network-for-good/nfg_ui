# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Nav doc coming soon
      class NavItem < NfgUi::Bootstrap::Components::NavItem
        include Bootstrap::Utilities::Tooltipable

        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
        include NfgUi::Components::Utilities::Traitable

        include NfgUi::Components::Traits::Active
        include NfgUi::Components::Traits::Disable
        include NfgUi::Components::Traits::NavItem
        include NfgUi::Components::Traits::Remote

        def render
          content_tag(as, html_options) do
            if include_nav_link?
              concat(NfgUi::Components::Elements::NavLink.new({ body: (button ? button : (block_given? ? yield : body)), active: active, disabled: disabled, dropdown: dropdown, tab: tab, remote: remote, href: (tab || href), icon: icon }, view_context).render)
              if dropdown
                concat(block_given? ? yield : body)
              end
            else
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
