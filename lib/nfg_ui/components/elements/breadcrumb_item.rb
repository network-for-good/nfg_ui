# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Breadcrumb doesn't have any customizations unique to the design system yet
      # As such, the NFG UI Breadcrumb is simply a bootstrap Breadcrumb behind the scenes.
      # Traits will eventually be connected here.
      class BreadcrumbItem < NfgUi::Bootstrap::Components::BreadcrumbItem
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Active
      end
    end
  end
end
