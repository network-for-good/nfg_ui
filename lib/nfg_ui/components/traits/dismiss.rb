# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Alert traits
      module Dismiss
        TRAITS = %i[dismissible].freeze
        
        def dismissible_trait
          options[:dismissible] = true
        end
      end
    end
  end
end
