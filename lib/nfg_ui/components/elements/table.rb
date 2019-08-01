# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Table doc coming soon
      class Table < NfgUi::Bootstrap::Components::Table
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Responsive
        include NfgUi::Components::Traits::Size
        include NfgUi::Components::Traits::Table

        def render
          # We manually embed this caption as a typeface component
          # as part of the design pattern.
          if responsive
            capture do
              concat(NfgUi::Components::Foundations::Typeface.new({caption: I18n.t('nfg_ui.components.elements.table.responsive_caption').to_s, class: 'mb-1 text-right', traits: [:muted]}, view_context).render)

              concat(super)
            end
          else
            super
          end
        end
      end
    end
  end
end
