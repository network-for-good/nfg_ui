# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Popover doc coming soon
      class Popover < Bootstrap::Components::Popover
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
      end
    end
  end
end
