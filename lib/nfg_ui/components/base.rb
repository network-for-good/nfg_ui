# frozen_string_literal: true

module NfgUi
  module Components
    # Base NFG UI component for components that are not directly
    # inherited from Bootstrap base components (e.g.: buttons inhert their 
    # Bootstrap counterpart, tiles don't).
    class Base < Bootstrap::Components::Base
      include NfgUi::Components::Utilities::Traitable
      include NfgUi::Components::Utilities::Describable
    end
  end
end
