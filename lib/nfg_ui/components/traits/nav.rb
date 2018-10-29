# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed traits
      module Nav
        TRAITS = %i[tabs].freeze

        def tabs_trait
          options[:tabs] = true
        end
      end
    end
  end
end
