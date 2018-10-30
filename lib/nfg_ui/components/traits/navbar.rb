# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed traits
      module Navbar
        TRAITS = %i[white].freeze

        def white_trait
          options[:light] = true
          # options[:class] += ' bg-white'
          options[:theme] = :white
        end
      end
    end
  end
end
