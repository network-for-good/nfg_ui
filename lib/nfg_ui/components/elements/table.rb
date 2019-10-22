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

        def caption
          options.fetch(:caption, default_caption)
        end

        def render
          # We manually embed this caption as a typeface component
          # as part of the design pattern.
          if caption.present?
            capture do
              concat(NfgUi::Components::Foundations::Typeface.new({caption: caption.to_s, class: 'mb-1 text-right', traits: [:muted]}, view_context).render)

              concat(super)
            end
          else
            super
          end
        end

        private

        # By default, when responsive: supply a pre-written caption to the table
        def default_caption
          responsive ? I18n.t('nfg_ui.components.elements.table.responsive_caption') : ''
        end

        def non_html_attribute_options
          super.push(:caption)
        end
      end
    end
  end
end
