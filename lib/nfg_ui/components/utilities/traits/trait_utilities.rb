# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      module Traits
        module TraitUtilities
          private

          # As a practice, traits are designed to help not rule.
          #
          # Leveraging this method to conditionally overwrite values in the options hash
          # ensures that users of the gem are able to use
          # traits and further customize them on the fly.
          #
          # Example:
          # An example trait adjusts an icon and the theme.
          # Gem user wants to customize the theme in a unique setting
          # = ui.nfg :icon, :tip, theme: :danger
          #
          # Without using this #maybe_update_option method, `theme: :danger`
          # would be ignored (and thus overwritten) by by the :tip trait
          #
          # Thus, when using this method, the :tip trait would first check if :theme option is present _before_
          # setting the established trait's options[:theme] value.
          #
          # It may not always be necessary or appropriate to use this method. For example,
          # Some traits modify only one value in options, and if that trait is being overwritten by a supplied option,
          # it defeats the purpose of the trait.
          #
          # Example where method usage is not necessary:
          # def active_trait
          #   options[:active] = true
          # end
          #
          # Overall, trait creation doctrine really
          # prefers usage of this method.
          #
          #
          # Example Usage:
          #
          # def white_trait
          #   maybe_update_option(:light, value: true)
          #   maybe_update_option(:theme, value: :white)
          # end
          def maybe_update_option(option_key, value:)
            return if options[option_key].present?
            options[option_key] = value
          end
        end
      end
    end
  end
end