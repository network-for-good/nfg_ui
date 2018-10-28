# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed theme traits
      module Vertical
        TRAITS = %i[vertical].freeze

        def vertical_trait
          options[:vertical] = true
        end
      end
    end
  end
end
