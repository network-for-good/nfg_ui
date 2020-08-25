module NfgUi
  module Components
    module Traits
      # Step traits
      module Slats
        TRAITS = %i[slat_actions_sm slat_actions_lg slat_actions_none nowrap].freeze

        def nowrap_trait
          options[:nowrap] = true
        end

        def slat_actions_sm_trait
          options[:slat_actions] = :sm
        end

        def slat_actions_lg_trait
          options[:slat_actions] = :lg
        end

        def slat_actions_none_trait
          options[:slat_actions] = :none
        end
      end
    end
  end
end
