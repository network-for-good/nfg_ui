# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Nav doc coming soon
      class NavbarBrand < Bootstrap::Components::NavbarBrand
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
        include NfgUi::Components::Utilities::VerticallyAlignable
      end
    end
  end
end
