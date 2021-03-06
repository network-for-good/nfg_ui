# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Bootstrap Parent Progress Component
      # https://getbootstrap.com/docs/4.1/components/progress/
      class Progress < NfgUi::Bootstrap::Components::Progress
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include Bootstrap::Utilities::Sizable
        include Bootstrap::Utilities::Tooltipable

        include NfgUi::Components::Traits::Theme
        include NfgUi::Components::Traits::Size
        include NfgUi::Components::Traits::ProgressBar

        private
      end
    end
  end
end
