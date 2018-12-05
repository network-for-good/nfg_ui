# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Alert doesn't have any customizations unique to the design system yet
      # As such, the NFG UI alert is simply a bootstrap alert behind the scenes.
      # Traits will eventually be connected here.
      class Alert < NfgUi::Bootstrap::Components::Alert
        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Alert
        include NfgUi::Components::Traits::Dismiss
        include NfgUi::Components::Traits::Theme

        def render
          super do
            if dismissible
              concat(NfgUi::Components::Elements::Button.new({ traits: [:close], dismiss: :alert }, view_context).render)
            end

            if icon
              concat(NfgUi::Components::Patterns::Media.new({}, view_context).render {
                concat(NfgUi::Components::Elements::MediaObject.new({}, view_context).render {
                  content_tag(:div, class: 'mr-2') do
                    NfgUi::Components::Foundations::Icon.new({ traits: [icon] }, view_context).render
                  end
                })
                concat(NfgUi::Components::Elements::MediaBody.new({}, view_context).render {
                  if heading
                    concat(NfgUi::Components::Foundations::Typeface.new({ heading: heading, class: 'alert-heading' }, view_context).render)
                  end
                  concat(block_given? ? yield : body)
                })
              })
            else
              if heading
                concat(NfgUi::Components::Foundations::Typeface.new({ heading: heading, class: 'alert-heading' }, view_context).render)
              end

              concat(block_given? ? yield : body)
            end
          end
        end
      end
    end
  end
end
