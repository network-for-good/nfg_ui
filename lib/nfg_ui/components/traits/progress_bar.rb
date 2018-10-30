module NfgUi
  module Components
    module Traits
      # Shared Size traits
      module ProgressBar
        TRAITS = %i[striped
                    animated
                    label].freeze

        def striped_trait
          options[:striped] = true
        end

        def animated_trait
          options[:animated] = true
        end

        def label_trait
          options[:label] = true
        end
      end
    end
  end
end
