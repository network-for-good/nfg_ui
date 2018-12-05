# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # TileBody doc coming soon
      class TileBody < NfgUi::Components::Base
        include NfgUi::Components::Utilities::Iconable

        def heading
          options.fetch(:heading, nil)
        end

        def component_family
          :tile
        end

        def render
          super do
            if heading
              concat(NfgUi::Components::Foundations::Typeface.new({ heading: heading, icon: icon }, view_context).render)
            end
            concat((block_given? ? yield : body))
          end
        end
      end
    end
  end
end
