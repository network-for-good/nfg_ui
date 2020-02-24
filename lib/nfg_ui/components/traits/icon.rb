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
            # We are unable to use #maybe_update_option method due to how traits
            # are calculated when sub components are
            # rendered within sub components (example: nav_link being rendered within a nav_item)...
            #
            # This will leave options[:right] alone unless
            # there is a value stored in the component's options[:right]
            #
            # Example where options[:right] is left alone:
            # ui.nfg(:icon, :tip, right: false, text: 'Tip icon is on the left')
            #
            # Example where options[:right] gets updated:
            # ui.nfg(:icon, :tip, text: 'Tip icon is on the right')
            options[:right] = true if options[:right].nil?
            options[:class] += ' fa-fw'
          end
        end
      end
    end
  end
end
