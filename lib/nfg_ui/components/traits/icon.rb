# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Button traits
      module Icon
        TRAITS = %i[right
                    loader].freeze
        # include NfgUi::Components::Traits
        # include NfgUi::Components::Traits::Theme

        # private

        def right_trait
          options[:right] = true
        #   @right = true
        end

        def loader_trait
          options[:icon] = 'spinner spin fw'
        end

        # def allowed_traits
        #   super.push(:right)
        # end

        # def skipped_traits
        #   super.push(icon)
        # end
      end
    end
  end
end
