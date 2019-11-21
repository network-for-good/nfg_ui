# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      module Traits
        module TraitUtilities

          private

          # As a practice, traits are designed to help not rule
          # Leveraging this method to conditionally overwrite values in the options hash
          # ensures that users of the gem are able to leverage
          # traits and further customize them on the fly.
          #
          # Example:
          # An example trait adjusts an icon and the theme.
          # Gem user wants to customize the theme in a unique setting
          # = ui.nfg :icon, :tip, theme: :danger
          #
          # Without using this theme, theme: :danger would be ignored by by the :tip trait.
          #
          # When using this theme, the :tip trait would first check if theme is present _before_
          # setting the trait's theme value.
          def maybe_update_option(option_key, value:)
            return if options[option_key].present?
            options[option_key] = value
          end
        end
      end
    end
  end
end