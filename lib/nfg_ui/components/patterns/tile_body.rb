# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # TileBody doc coming soon
      class TileBody < NfgUi::Components::Base
        require 'nfg_ui/bootstrap/utilities/collapsible'

        include Bootstrap::Utilities::Collapsible

        def initialize(*)
          super
          @body = collapse_capable_body
        end

        private

        def collapse_capable_body
          collapsible? ? collapsible_wrapper_html : collapsible_body_html
        end

        def tile_body_html_id
          collapsible? ? id : ''
        end

        def collapsible_target_id
          collapsible? ? "target_collapsible_id_for_#{id}" : ''
        end

        def component_family
          :tile
        end
      end
    end
  end
end
