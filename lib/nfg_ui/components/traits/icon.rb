# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Icon traits
      module Icon
        include NfgUi::Components::Utilities::Traits::TraitUtilities

        TRAITS = %i[loader tip].freeze

        def loader_trait
          options[:icon] = 'spinner spin fw'
        end

        # The defacto "(?)" tip icon
        # Usage:
        # ui.nfg :icon, :tip, tooltip: 'The tip'
        def tip_trait
          maybe_update_option(:icon, value: NfgUi::DEFAULT_TIP_ICON)

          maybe_update_option(:theme, value: NfgUi::DEFAULT_TIP_THEME)

          if options[:text].present?
            maybe_update_option(:right, value: true)
            options[:class] += ' fa-fw'
          end
        end
      end
    end
  end
end
