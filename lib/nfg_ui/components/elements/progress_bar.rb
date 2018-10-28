# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # ProgressBar doc coming soon
      class ProgressBar < Bootstrap::Components::Progress
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
      end
    end
  end
end
