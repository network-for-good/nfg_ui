# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # TileSection doc coming soon
      class TileSection < NfgUi::Components::Base
        include NfgUi::Components::Utilities::Iconable

        def heading
          options.fetch(:heading, nil)
        end

        def component_family
          :tile
        end
      end
    end
  end
end
