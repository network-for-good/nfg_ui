# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Table doc coming soon
      class Table < NfgUi::Bootstrap::Components::Table
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
