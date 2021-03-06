# frozen_string_literal: true

module NfgUi
  module Components
    # Base NFG UI component for components that are not directly
    # inherited from Bootstrap base components (e.g.: buttons inhert their
    # Bootstrap counterpart, tiles don't).
    class Base < NfgUi::Bootstrap::Components::Base
      include NfgUi::Components::Utilities::Describable
      include NfgUi::Components::Utilities::Renderable
      include NfgUi::Components::Utilities::Traitable
    end
  end
end
