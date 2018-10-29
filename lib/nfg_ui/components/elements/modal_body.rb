# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # doc coming soon
      class ModalBody < Bootstrap::Components::ModalBody
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
      end
    end
  end
end
