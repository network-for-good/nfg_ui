# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Slat doc coming soon
      class SlatActions < NfgUi::Components::Base
        # Includes a workaround suite of functionality
        # to integrate a singular SlatAction automatically when
        # The SlatActions component is rendered when the `:menu` option is set to false.
        #
        # When menu is set to false:
        # You can then pass in SlatAction options in the parent SlatAction
        #
        # Example usage:
        # ui.nfg(:slat_actions, menu: false, theme: :parent, body: 'My Custom Slat Action')
        # require 'nfg_ui/components/utilities/patches/integrated_slat_action'
        include NfgUi::Components::Utilities::Patches::IntegratedSlatAction

        def component_family
          :slats
        end

        # Signals whether or not this SlatActions will house a menu
        # This is a critical condition.
        # When false, a SlatAction is automatically integrated on your behalf.
        def menu
          options.fetch(:menu, true)
        end

        def render
          content_tag(:div, html_options) do
            if menu
              NfgUi::Components::Patterns::Dropdown.new({ }, view_context).render do
                capture do
                  concat(NfgUi::Components::Elements::DropdownToggle.new({ **default_dropdown_toggle_options, body: dropdown_toggle_body }, view_context).render)
                  concat(NfgUi::Components::Patterns::DropdownMenu.new({ traits: [:right] }, view_context).render {
                    (block_given? ? yield : body)
                  })
                end
              end
            else
              # Render the integrated slat action and pass in all of the
              # related slat action options that are present in this SlatActions `:options`
              render_integrated_slat_action
            end
          end
        end

        private

        def default_dropdown_toggle_options
          { outlined: true, theme: :secondary }
        end

        def dropdown_toggle_body
          content_tag(:span, 'Actions', class: 'slat-actions-text')
        end

        def non_html_attribute_options
          super.push(:menu)
        end
      end
    end
  end
end
