# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Badge doesn't have any customizations unique to the design system yet
      # As such, the NFG UI badge is simply a bootstrap badge behind the scenes.
      # Traits will eventually be connected here.
      class DropdownToggle < NfgUi::Bootstrap::Components::DropdownToggle
        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::DropdownToggle
        include NfgUi::Components::Traits::Size
        include NfgUi::Components::Traits::Theme

        def icon
          options.fetch(:icon, 'caret-down')
        end

        def left_icon
          options.fetch(:left_icon, nil)
        end

        def render
          NfgUi::Components::Elements::Button.new({ as: as, theme: theme, **html_options, remove_component_css_classes: nav_link, icon: icon }, view_context).render do
            capture do
              if left_icon
                concat(NfgUi::Components::Foundations::Icon.new({ traits: [left_icon], class: 'mr-1' }, view_context).render)
              end
              concat(block_given? ? yield : body)
            end
          end
        end
      end
    end
  end
end
