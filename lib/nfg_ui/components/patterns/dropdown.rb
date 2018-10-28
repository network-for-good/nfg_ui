# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Badge doesn't have any customizations unique to the design system yet
      # As such, the NFG UI badge is simply a bootstrap badge behind the scenes.
      # Traits will eventually be connected here.
      class Dropdown < Bootstrap::Components::Dropdown
        include NfgUi::Components::Utilities::Traitable
      end
    end
  end
end
