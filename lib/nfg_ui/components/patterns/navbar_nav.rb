# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Nav doc coming soon
      class NavbarNav < Bootstrap::Components::NavbarNav
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
