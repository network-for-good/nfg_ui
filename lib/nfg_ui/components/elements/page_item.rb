# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Pagination sub component (page items)
      class PageItem < NfgUi::Bootstrap::Components::PageItem
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
      end
    end
  end
end
