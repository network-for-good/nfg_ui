module NfgUi
  module Components
    module Traits
      # Shared Size traits
      module Remote
        TRAITS = %i[remote].freeze

        def remote_trait
          options[:remote] = true
        end
      end
    end
  end
end
