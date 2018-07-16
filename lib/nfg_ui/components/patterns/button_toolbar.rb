# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Button Toolbar doesn't have any customizations unique to the design system yet
      # As such, the NFG UI button group is simply a bootstrap button group behind the scenes.
      # Traits will eventually be connected here.
      class ButtonToolbar < Bootstrap::Components::ButtonToolbar
      end
    end
  end
end
