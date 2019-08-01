module NfgUi
  module Components
    module Traits
      module Responsive
        TRAITS = %i[responsive].freeze

        def responsive_trait
          options[:responsive] = true
        end
      end
    end
  end
end
