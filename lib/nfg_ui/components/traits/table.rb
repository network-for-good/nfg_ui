# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      module Table
        TRAITS = %i[striped bordered].freeze

        def striped_trait
          options[:striped] = true
        end

        def bordered_trait
          options[:bordered] = true
        end
      end
    end
  end
end
