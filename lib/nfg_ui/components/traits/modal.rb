# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      module Modal
        TRAITS = %i[cover].freeze

        def cover_trait
          options[:size] = :cover
        end
      end
    end
  end
end
