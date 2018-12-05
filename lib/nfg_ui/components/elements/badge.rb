# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Badge doesn't have any customizations unique to the design system yet
      # As such, the NFG UI badge is simply a bootstrap badge behind the scenes.
      # Traits will eventually be connected here.
      class Badge < NfgUi::Bootstrap::Components::Badge
        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Theme
        include NfgUi::Components::Traits::Pill

        def render
          content_tag(as, html_options) do
            if icon
              NfgUi::Components::Foundations::Icon.new({ traits: [icon], text: body }, view_context).render
            else
              (block_given? ? yield : body)
            end
          end
        end
      end
    end
  end
end
