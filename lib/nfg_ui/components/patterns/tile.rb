# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Tile doc coming soon
      class Tile < NfgUi::Components::Base
        include Bootstrap::Utilities::Collapsible
        include NfgUi::Components::Utilities::Titleable
        include NfgUi::Components::Utilities::Iconable

        def initialize(*)
          super
        end

        def tile_body_css_class
          css_class = ''
          css_class += ' collapse' if collapsible?
          css_class += collapsed? ? '' : ' show'
          css_class
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
