# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Tile doc coming soon
      class Tile < Bootstrap::Components::Base
        attr_reader :icon

        private

        def defaults
          super.merge!(icon: 'circle-o')
        end

        def component_family
          :tile
        end

        def non_html_attribute_options
          super.push(:icon)
        end
      end
    end
  end
end
