# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Docs coming soon
      class CarouselIndicators < Bootstrap::Components::CarouselIndicators
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
