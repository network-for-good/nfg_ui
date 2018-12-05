# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Information coming soon
      class DropdownMenu < NfgUi::Bootstrap::Components::DropdownMenu
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Alignment
      end
    end
  end
end
