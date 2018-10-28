# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Alert traits
      module PageHeader
        TRAITS = %i[sticky].freeze

        def sticky_trait
          options[:sticky] = true
        end
      end
    end
  end
end
