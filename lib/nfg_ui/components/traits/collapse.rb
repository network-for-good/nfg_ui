# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Card traits
      module Collapse
        TRAITS = %i[collapsible
                    collapsed
                    navbar].freeze

        # private

        # Set component to collapse capable
        def collapsible_trait
          options[:collapsible] = true
        end

        def collapsed_trait
          options[:collapsed] = true
        end

        def navbar_trait
          options[:navbar] = true
        end
      end
    end
  end
end
