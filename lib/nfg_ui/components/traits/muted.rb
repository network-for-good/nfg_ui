# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Icon traits
      module Muted
        TRAITS = %i[muted].freeze
        
        def muted_trait
          options[:class] += ' text-muted'
        end
      end
    end
  end
end
