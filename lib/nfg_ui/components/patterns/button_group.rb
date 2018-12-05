# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Button Group doesn't have any customizations unique to the design system yet
      # As such, the NFG UI button group is simply a bootstrap button group behind the scenes.
      # Traits will eventually be connected here.
      class ButtonGroup < NfgUi::Bootstrap::Components::ButtonGroup
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Size
        include NfgUi::Components::Traits::Vertical

        # TODO It's not clear to me whether the traits listed above actually do anything
        # I think the note above implies that they don't, but then why include them? If they don't
        # actually do anything yet, they should be removed, or at least commented out
      end
    end
  end
end
