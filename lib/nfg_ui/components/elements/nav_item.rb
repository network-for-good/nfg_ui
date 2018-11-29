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
      end
    end
  end
end
