# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Badge doesn't have any customizations unique to the design system yet
      # As such, the NFG UI badge is simply a bootstrap badge behind the scenes.
      # Traits will eventually be connected here.
      class DropdownToggle < Bootstrap::Components::DropdownToggle
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Traits::Size
      end
    end
  end
end
