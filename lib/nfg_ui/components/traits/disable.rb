# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Card traits
      module Disable
        TRAITS = %i[disable].freeze

        # private

        # Set component to collapse capable
        def disable_trait
          options[:disabled] = true
        end
      end
    end
  end
end
