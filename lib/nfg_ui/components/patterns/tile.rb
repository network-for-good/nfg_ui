# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Tile doc coming soon
      class Tile < NfgUi::Components::Base
        include Bootstrap::Utilities::Collapsible
        include NfgUi::Components::Utilities::Titleable
        include NfgUi::Components::Utilities::Iconable

        def collapsible_tile_wrapper_css_class
          ' collapse' + (' show' if collapsed?) unless collapsible?
        end

        private

        def css_classes
          super + ' mt-3'
        end

        def default_collapsible
          false
        end

        def component_family
          :tile
        end
      end
    end
  end
end
