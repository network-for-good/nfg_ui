# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Card traits
      module Disable
        TRAITS = %i[disabled].freeze

        # private

        # Set component to collapse capable
        def disabled_trait
          options[:disabled] = true
        end
      end
    end
  end
end
