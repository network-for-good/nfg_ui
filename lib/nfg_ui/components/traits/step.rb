module NfgUi
  module Components
    module Traits
      # Step traits
      module Step
        TRAITS = %i[visited active].freeze

        def visited_trait
          options[:visited] = true
        end

        def active_trait
          super
          # Active is a transitory state for steps
          # So when a step is active, it is automatically visited.
          # This sets visited to true.
          # This is also accounted for in the #active_trait for steps.
          options[:visited] = true
        end
      end
    end
  end
end
