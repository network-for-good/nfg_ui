# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Nav doc coming soon
      class NavbarNav < NfgUi::Bootstrap::Components::NavbarNav
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
        include NfgUi::Components::Utilities::VerticallyAlignable

        include NfgUi::Components::Traits::Alignment
      end
    end
  end
end
