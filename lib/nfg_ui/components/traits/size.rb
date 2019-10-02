module NfgUi
  module Components
    module Traits
      # Shared Size traits
      module Size
        TRAITS = %i[sm md lg xl].freeze

        def lg_trait
          options[:size] = :lg
        end

        def md_trait
          options[:size] = :md
        end

        def sm_trait
          options[:size] = :sm
        end

        def xl_trait
          options[:size] = :xl
        end
      end
    end
  end
end
