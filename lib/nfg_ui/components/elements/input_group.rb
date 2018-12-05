# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # InputGroup doc coming soon
      class InputGroup < NfgUi::Bootstrap::Components::InputGroup
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
