# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Docs coming soon
      class Pagination < Bootstrap::Components::Pagination
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
