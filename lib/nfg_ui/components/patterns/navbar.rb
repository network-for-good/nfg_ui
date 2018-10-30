# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Navbar docs coming soon
      class Navbar < Bootstrap::Components::Navbar
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Theme
        include NfgUi::Components::Traits::Navbar
      end
    end
  end
end
