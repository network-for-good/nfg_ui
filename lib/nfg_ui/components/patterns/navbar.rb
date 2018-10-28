# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Navbar docs coming soon
      class Navbar < Bootstrap::Components::Navbar
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
      end
    end
  end
end
