# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Alert traits
      module Alert
        include NfgUi::Components::Utilities::Traits::TraitUtilities

        TRAITS = %i[tip].freeze

        def tip_trait
          maybe_update_option(:icon, value: NfgUi::DEFAULT_TIP_ICON)
          maybe_update_option(:theme, value: NfgUi::DEFAULT_TIP_THEME)
          maybe_update_option(:dismissible, value: false)
        end
      end
    end
  end
end
