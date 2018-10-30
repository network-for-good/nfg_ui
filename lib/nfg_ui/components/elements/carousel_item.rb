# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Docs coming soon
      class CarouselItem < Bootstrap::Components::CarouselItem
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
