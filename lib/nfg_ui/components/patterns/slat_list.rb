# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # SlatList doc coming soon
      class SlatList < NfgUi::Components::Base
        include Bootstrap::Utilities::Sizable

        include NfgUi::Components::Traits::Size
        
        def component_family
          :slats
        end
      end
    end
  end
end
