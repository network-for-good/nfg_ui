# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # ProgressBar doc coming soon
      class ProgressBar < Bootstrap::Components::Progress
        require_relative '../traits/theme'
        include NfgUi::Components::Traits::Theme
      end
    end
  end
end
