# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Main slats
      class Slats < NfgUi::Components::Base
        include Bootstrap::Utilities::Sizable
        include NfgUi::Components::Traits::Size

        def component_family
          :slats
        end
      end
    end
  end
end
