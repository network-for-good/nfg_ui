# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Ino coming soon.
      class DropdownItem < NfgUi::Bootstrap::Components::DropdownItem
        include Bootstrap::Utilities::Themeable
        include Bootstrap::Utilities::Modalable

        include NfgUi::Components::Utilities::Confirmable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::DisableWithable
        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Renderable
        include NfgUi::Components::Utilities::Traitable

        include NfgUi::Components::Traits::Remote
        include NfgUi::Components::Traits::Active
        include NfgUi::Components::Traits::DisableWith
        include NfgUi::Components::Traits::Disable
        include NfgUi::Components::Traits::Theme

        # We do not want to overwrite button_to's interpretation
        # of `method`. Conditionally include Methodable
        # when not using as: :button_to
        def initialize(*)
          super
          if as != :button_to
            extend NfgUi::Components::Utilities::Methodable
          end
        end

        def render
          if tooltip && disabled
            content_tag(:span, disabled_component_tooltip_wrapper_html_options) do
              content_tag(as, html_options.except(:href)) do
                yield_icon_or_body
              end
            end
          elsif as == :button_to
            # Manually pass in url_for args for routing
            # example: = ui.nfg :dropdown_item, as: :button_to, button_url: some_action_path(@object)
            url_for_option = options.delete(:button_url)

            view_context.button_to(url_for_option, html_options) do
              yield_icon_or_body
            end
          else
            super do
              yield_icon_or_body
            end
          end
        end

        # Automatically supply an :href to the dropdown item when a modal is present
        # so that the dropdown item presents correctly and appears clickable
        def href
          super || (modal ? '#' : nil)
        end

        private

        def yield_icon_or_body
          if icon
            NfgUi::Components::Foundations::Icon.new({ traits: ["#{icon} fw"], text: (block_given? ? yield : body), class: 'text-center' }, view_context).render
          else
            (block_given? ? yield : body)
          end
        end

        def base_element
          as
        end

        def default_theme
          nil
        end

        def theme_css_class_prefix
          'text-'
        end

        def outlineable?
          false
        end

        # Other classes inherit DropdownItem (ex: SlatAction)
        def component_css_class
          'dropdown-item'
        end
      end
    end
  end
end
