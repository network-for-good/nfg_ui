# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Icon traits
      module Icon
        TRAITS = %i[loader tip].freeze

        def loader_trait
          options[:icon] = 'spinner spin fw'
        end

        # The defacto "(?)" tip icon
        # Usage:
        # ui.nfg :icon, :tip, tooltip: 'The tip'
        def tip_trait
          options[:icon] = NfgUi::DEFAULT_TIP_ICON
          options[:theme] = NfgUi::DEFAULT_TIP_THEME

          if options[:text].present?
            options[:right] = true
            options[:class] += ' fa-fw'
          end
        end
      end
    end
  end
end
