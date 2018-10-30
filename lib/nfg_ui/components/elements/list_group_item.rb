# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # ListGroupItem doc coming soon
      class ListGroupItem < Bootstrap::Components::ListGroupItem
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
        # private
        
        # def component_family
        #   nil
        # end
      end
    end
  end
end
