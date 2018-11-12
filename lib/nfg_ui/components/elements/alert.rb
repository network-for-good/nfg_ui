# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Alert doesn't have any customizations unique to the design system yet
      # As such, the NFG UI alert is simply a bootstrap alert behind the scenes.
      # Traits will eventually be connected here.
      class Alert < Bootstrap::Components::Alert
        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
        
        include NfgUi::Components::Traits::Alert
        include NfgUi::Components::Traits::Dismiss
        include NfgUi::Components::Traits::Theme
      end
    end
  end
end
