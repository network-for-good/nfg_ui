# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      class TabPane < Bootstrap::Components::TabPane
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
