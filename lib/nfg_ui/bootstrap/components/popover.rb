# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Popover Component
      # https://getbootstrap.com/docs/4.1/components/popovers/
      class Popover < Bootstrap::Components::Base
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
