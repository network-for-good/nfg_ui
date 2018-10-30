# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Button doesn't have any customizations unique to the design system yet
      # As such, the NFG UI Button is simply a bootstrap Button behind the scenes.
      # Traits will eventually be connected here.
      class Button < Bootstrap::Components::Button
        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Active
        include NfgUi::Components::Traits::Button
        include NfgUi::Components::Traits::Size
        include NfgUi::Components::Traits::Theme
        include NfgUi::Components::Traits::Disable

        def data
          if disable_with
            super.merge!(disable_with: disable_with)
          else
            super
          end
        end

        def disable_with
          options.fetch(:disable_with, nil)
        end

        private

        def default_disable_with
          view_context.ui.nfg(:icon, :loader, text: 'Saving...')
        end

        def non_html_attribute_options
          super.push(:disable_with)
        end
      end
    end
  end
end
