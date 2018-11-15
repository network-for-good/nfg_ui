module NfgUi
  module Components
    module Traits
      # Shared Size traits
      module DropdownToggle
        TRAITS = %i[split].freeze

        def split_trait
          options[:split] = true
        end
      end
    end
  end
end
