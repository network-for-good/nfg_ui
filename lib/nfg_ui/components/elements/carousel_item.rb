# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Docs coming soon
      class CarouselItem < NfgUi::Bootstrap::Components::CarouselItem
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Active
      end
    end
  end
end
