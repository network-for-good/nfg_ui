module NfgUi
  module Components
    module Traits
      # Shared Size traits
      module Illustration
        TRAITS = %i[responsive].freeze

        def responsive_trait
          options[:responsive] = true
        end
      end
    end
  end
end
