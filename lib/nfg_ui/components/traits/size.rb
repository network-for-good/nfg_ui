module NfgUi
  module Components
    module Traits
      # Shared Size traits
      module Size

        def lg_trait
          @size = :lg
        end
        alias_method :large_trait, :lg_trait

        def sm_trait
          @size = :sm
        end
        alias_method :small_trait, :sm_trait

        def allowed_traits
          super.push(:lg, 
                     :large, 
                     :sm, 
                     :small)
        end

      end
    end
  end
end