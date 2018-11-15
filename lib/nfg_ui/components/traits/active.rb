module NfgUi
  module Components
    module Traits
      # Shared Size traits
      module Active
        TRAITS = %i[active].freeze

        def active_trait
          options[:active] = true
        end
      end
    end
  end
end
