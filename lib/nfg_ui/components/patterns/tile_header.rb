# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # TileHeader doc coming soon
      class TileHeader < NfgUi::Components::Base
        include Bootstrap::Utilities::Collapsible

        include NfgUi::Components::Utilities::Titleable
        include NfgUi::Components::Utilities::Iconable

        def component_family
          :tile
        end
      end
    end
  end
end
