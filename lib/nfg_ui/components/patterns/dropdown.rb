# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Badge doesn't have any customizations unique to the design system yet
      # As such, the NFG UI badge is simply a bootstrap badge behind the scenes.
      # Traits will eventually be connected here.
      class Dropdown < NfgUi::Bootstrap::Components::Dropdown
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Theme

        def render
          content_tag(:div, html_options) do
            if button.present?
              concat(NfgUi::Bootstrap::Components::DropdownToggle.new({ body: button, theme: theme, as: :button, offset: offset }, view_context).render)
            end
            concat(block_given? ? yield : body)
          end
        end
      end
    end
  end
end
