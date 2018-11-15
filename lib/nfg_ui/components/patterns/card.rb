# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Card doesn't have any customizations unique to the design system yet
      # As such, the NFG UI card is simply a bootstrap card behind the scenes.
      # Traits will eventually be connected here.
      class Card < Bootstrap::Components::Card
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
        
        include NfgUi::Components::Traits::Theme
        
        def render_in_body
          options.fetch(:render_in_body, true)
        end

        private

        def non_html_attribute_options
          super.push(:render_in_body)
        end
      end
    end
  end
end
