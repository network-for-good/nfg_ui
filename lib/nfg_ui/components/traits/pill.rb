module NfgUi
  module Components
    module Traits
      # Shared Size traits
      module Pill
        TRAITS = %i[pill].freeze

        def pill_trait
          options[:pill] = true
        end
      end
    end
  end
end
