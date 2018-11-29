# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Modal docs coming soon
      class Modal < NfgUi::Bootstrap::Components::Modal
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
        include NfgUi::Components::Utilities::Titleable
      end
    end
  end
end
