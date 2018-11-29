# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # doc coming soon
      class ModalBody < NfgUi::Bootstrap::Components::ModalBody
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
