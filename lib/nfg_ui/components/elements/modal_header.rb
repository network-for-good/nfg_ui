# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # doc coming soon
      class ModalHeader < Bootstrap::Components::ModalHeader
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
      end
    end
  end
end
