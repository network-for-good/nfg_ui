# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # TileHeader doc coming soon
      class TileHeader < NfgUi::Components::Base
        include Utilities::Requireable
        include Utilities::Titleable
        include Utilities::Iconable

        private

        def required
          [:id]
        end

        def component_family
          :tile
        end
      end
    end
  end
end
