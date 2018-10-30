# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Ino coming soon.
      class DropdownItem < Bootstrap::Components::DropdownItem
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
