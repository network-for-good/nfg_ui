# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Badge doesn't have any customizations unique to the design system yet
      # As such, the NFG UI badge is simply a bootstrap badge behind the scenes.
      # Traits will eventually be connected here.
      class Badge < Bootstrap::Components::Badge
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
        
        include NfgUi::Components::Traits::Theme
        include NfgUi::Components::Traits::Pill
      end
    end
  end
end
