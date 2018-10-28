# frozen_string_literal: true

module NfgUi
  module Components
    # Base NFG UI component for compnoents that are not directly
    # inherited from Bootstrap base components (e.g.: buttons do not
    # inherit this Base class, but Tile does)
    class Base < Bootstrap::Components::Base
      include NfgUi::Components::Utilities::Traitable
      
      def local_base_initialize
        # local_initialize # not sure if i need this yet. will allow custom initialize within components
        # initialize_traits # applies traits to the component
      end

      # def local_initialize; end
    end
  end
end
