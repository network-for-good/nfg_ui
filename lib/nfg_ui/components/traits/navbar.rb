# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed traits
      module Navbar
        include NfgUi::Components::Utilities::Traits::TraitUtilities

        TRAITS = %i[white].freeze

        def white_trait
          maybe_update_option(:light, value: true)
          maybe_update_option(:theme, value: :white)
        end
      end
    end
  end
end
