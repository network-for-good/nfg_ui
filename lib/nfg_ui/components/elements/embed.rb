# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Embed documentation coming soon
      # Pass in embeddable aspect ratios with aspect_ratio: '16:9' syntax
      class Embed < Bootstrap::Components::Embed
        include NfgUi::Components::Utilities::Traitable
      end
    end
  end
end
