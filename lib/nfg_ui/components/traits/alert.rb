# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Alert traits
      module Alert
        TRAITS = %i[tip].freeze

        def tip_trait
          options[:icon] = NfgUi::DEFAULT_TIP_ICON
          options[:theme] = NfgUi::DEFAULT_TIP_THEME
          options[:dismissible] = false
        end
      end
    end
  end
end
