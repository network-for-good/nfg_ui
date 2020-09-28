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

        include NfgUi::Components::Traits::Modal
        include NfgUi::Components::Traits::Size

        private

        def resized?
          [:sm, :lg, :xl, :cover].include?(size)
        end
      end
    end
  end
end
