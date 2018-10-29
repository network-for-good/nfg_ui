# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Nav doc coming soon
      class NavLink < Bootstrap::Components::NavLink
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
      end
    end
  end
end
