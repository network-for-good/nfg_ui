# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Modal docs coming soon
      class TabContent < NfgUi::Bootstrap::Components::TabContent
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
