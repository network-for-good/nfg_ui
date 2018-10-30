# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Ino coming soon.
      class DropdownItem < Bootstrap::Components::DropdownItem
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Remote
        include NfgUi::Components::Traits::Active
        include NfgUi::Components::Traits::Disable
      end
    end
  end
end
