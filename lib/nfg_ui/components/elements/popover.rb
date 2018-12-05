# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Popover doc coming soon
      class Popover < NfgUi::Bootstrap::Components::Popover
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
