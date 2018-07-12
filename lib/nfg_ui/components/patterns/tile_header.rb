# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # TileHeader doc coming soon
      class TileHeader < NfgUi::Components::Base
        include Bootstrap::Utilities::Collapsible
        include NfgUi::Components::Utilities::Requireable
        include NfgUi::Components::Utilities::Titleable
        include NfgUi::Components::Utilities::Iconable
        
        def collapsible_toggle_html_options
          super.merge!(class: 'd-block no-link-color')
        end
        
        private

        def required
          [:id]
        end

        def collapsible_target_id
          "target_collapsible_id_for_#{id}"
        end

        def component_family
          :tile
        end
      end
    end
  end
end
