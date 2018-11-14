module NfgUi
  module Components
    module Traits
      # Access to disable_with traits
      module DisableWith
        TRAITS = %i[disable_with].freeze

        def disable_with_trait
          data[:disable_with] = default_disable_with
        end
      end
    end
  end
end
