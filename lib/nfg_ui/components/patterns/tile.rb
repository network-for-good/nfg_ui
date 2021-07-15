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

        def button
          options.fetch(:button, nil)
        end

        def href
          options.fetch(:href, nil)
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
                concat(NfgUi::Components::Patterns::TileHeader.new({ title: title, subtitle: subtitle, button: button, href: href, icon: icon, collapsible: collapsible, collapsed: collapsed, collapse: ("#collapse_#{id}" if collapsible) }, view_context).render)
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

        def subtitle
          options.fetch(:subtitle, nil)
        end

        private

        def non_html_attribute_options
          super.push(:heading, :render_in_body, :subtitle, :button, :href)
        end
      end
    end
  end
end
