# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # MediaGroup doc coming soon
      class Media < Bootstrap::Components::Media
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
