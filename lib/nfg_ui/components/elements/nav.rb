# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Nav doc coming soon
      class Nav < Bootstrap::Components::Nav
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
        
        include NfgUi::Components::Traits::Alignment
        include NfgUi::Components::Traits::Nav
        include NfgUi::Components::Traits::Pill
        include NfgUi::Components::Traits::Vertical
      end
    end
  end
end
