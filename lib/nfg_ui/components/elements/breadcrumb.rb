# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Breadcrumb doesn't have any customizations unique to the design system yet
      # As such, the NFG UI Breadcrumb is simply a bootstrap Breadcrumb behind the scenes.
      # Traits will eventually be connected here.
      class Breadcrumb < Bootstrap::Components::Breadcrumb
      end
    end
  end
end
