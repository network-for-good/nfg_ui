# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Carousel doesn't have any customizations unique to the design system yet
      # As such, the NFG UI carousel is simply a bootstrap carousel behind the scenes.
      # Traits will eventually be connected here.
      class Carousel < Bootstrap::Components::Carousel
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
