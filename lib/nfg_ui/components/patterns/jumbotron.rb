# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Jumbotron docs coming soon
      class Jumbotron < Bootstrap::Components::Jumbotron
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
