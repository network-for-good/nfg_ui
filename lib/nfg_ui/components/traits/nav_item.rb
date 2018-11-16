# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed traits
      module NavItem
        TRAITS = %i[dropdown].freeze

        def dropdown_trait
          options[:dropdown] = true
        end
      end
    end
  end
end
