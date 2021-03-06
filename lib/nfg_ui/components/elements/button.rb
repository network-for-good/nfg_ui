# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Button doesn't have any customizations unique to the design system yet
      # As such, the NFG UI Button is simply a bootstrap Button behind the scenes.
      # Traits will eventually be connected here.
      class Button < NfgUi::Bootstrap::Components::Button
        include NfgUi::Components::Utilities::Confirmable
        include NfgUi::Components::Utilities::DisableWithable
        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::LeftIconable
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Methodable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Active
        include NfgUi::Components::Traits::Button
        include NfgUi::Components::Traits::DisableWith
        include NfgUi::Components::Traits::Size
        include NfgUi::Components::Traits::Theme
        include NfgUi::Components::Traits::Disable
        include NfgUi::Components::Traits::Remote

        def data
          dismiss ? super.merge!(dismiss: dismiss) : super
        end

        # TODO
        def close
          # convert :close trait to
          # close: :alert
        end

        def method
          options.fetch(:method, nil)
        end

        def dismiss
          options.fetch(:dismiss, nil)
        end

        def render
          @body = yield if block_given?

          if tooltip && disabled
            content_tag(:span, disabled_component_tooltip_wrapper_html_options) do
              content_tag(as, html_options) do
                capture do
                  concat(left_icon_component) if left_icon
                  concat(body)
                  concat(right_icon_component) if icon
                end
              end
            end

          else
            content_tag(as, html_options) do
              capture do
                concat(left_icon_component) if left_icon
                concat(body)
                concat(right_icon_component) if icon
              end
            end
          end
        end

        private

        def left_icon_component
          NfgUi::Components::Foundations::Icon.new({ traits: [left_icon],
                                                     class: NfgUi::Components::Foundations::Icon::LEFT_ICON_SPACER_CSS_CLASS },
                                                   view_context).render

        end

        def right_icon_component
          NfgUi::Components::Foundations::Icon.new({ traits: [icon, :right],
                                                     class: right_icon_class },
                                                   view_context).render
        end

        def right_icon_class
          NfgUi::Components::Foundations::Icon::RIGHT_ICON_SPACER_CSS_CLASS if body.present?
        end

        def base_element
          as
        end

        def dismiss_component?
          dismiss == :alert || dismiss == :modal
        end

        def non_html_attribute_options
          super.push(:dismiss)
        end
      end
    end
  end
end
