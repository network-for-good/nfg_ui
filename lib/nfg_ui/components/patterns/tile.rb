# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Tile doc coming soon
      class Tile < NfgUi::Components::Base
        include Bootstrap::Utilities::Collapsible

        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Titleable

        include NfgUi::Components::Traits::Collapse

        def heading
          options.fetch(:heading, nil)
        end

        def component_family
          :tile
        end

        def render_in_body
          options.fetch(:render_in_body, true)
        end

        def render
          super do
            if render_in_body
              if title.present?
                concat(NfgUi::Components::Patterns::TileHeader.new({ title: title, icon: icon, collapsible: collapsible, collapse: ("#collapse_#{id}" if collapsible) }, view_context).render)
              end
              if collapsible
                concat(NfgUi::Components::Patterns::Collapse.new({ id: "collapse_#{id}", collapsed: collapsed }, view_context).render {
                  NfgUi::Components::Patterns::TileBody.new({ heading: heading }, view_context).render do
                    (block_given? ? yield : body)
                  end
                })
              else
                concat(NfgUi::Components::Patterns::TileBody.new({ heading: heading }, view_context).render {
                  (block_given? ? yield : body)
                })
              end
            else
              (block_given? ? yield : body)
            end
          end
        end

        private

        def non_html_attribute_options
          super.push(:heading, :render_in_body)
        end
      end
    end
  end
end
