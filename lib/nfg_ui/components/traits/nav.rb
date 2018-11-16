# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed traits
      module Nav
        TRAITS = %i[tabs
                    fill
                    justify].freeze

        def tabs_trait
          options[:tabs] = true
        end

        def fill_trait
          options[:fill] = true
        end

        def justify_trait
          options[:justify] = true
        end
      end
    end
  end
end
