module NfgUi
  module Components
    module Traits
      # Shared Size traits
      module Size
        TRAITS = %i[lg sm].freeze

        def lg_trait
          options[:size] = :lg
        end

        def sm_trait
          options[:size] = :sm
        end
      end
    end
  end
end
