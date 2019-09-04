# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      class ButtonGroup < NfgUi::Bootstrap::Components::ButtonGroup
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Size
        include NfgUi::Components::Traits::Vertical
      end
    end
  end
end
