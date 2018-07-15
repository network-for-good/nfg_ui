# frozen_string_literal: true

module NfgUi
  module Components
    # Base NFG UI component for compnoents that are not directly
    # inherited from Bootstrap base components (e.g.: buttons do not
    # inherit this Base class, but Tile does)
    class Base < Bootstrap::Components::Base
    end
  end
end
