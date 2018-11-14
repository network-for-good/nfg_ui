# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # ListGroup docs coming soon
      class ListGroup < Bootstrap::Components::ListGroup
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::ListGroup
      end
    end
  end
end
