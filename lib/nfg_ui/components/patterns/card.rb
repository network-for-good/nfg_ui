# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Card doesn't have any customizations unique to the design system yet
      # As such, the NFG UI card is simply a bootstrap card behind the scenes.
      # Traits will eventually be connected here.
      class Card < Bootstrap::Components::Card
      end
    end
  end
end
