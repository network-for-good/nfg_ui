# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # TileHeader doc coming soon
      class TileHeader < NfgUi::Components::Base
        include Bootstrap::Utilities::Collapsible

        include NfgUi::Components::Utilities::Titleable
        include NfgUi::Components::Utilities::Iconable

        def component_family
          :tile
        end

        def render
          super do
            if collapsible && title
              concat(NfgUi::Components::Elements::Button.new({ traits: [:link, :block], collapse: collapse, class: 'no-link-color p-0 m-0' }, view_context).render {
                content_tag(:div, class: 'row align-items-center') do
                  concat(content_tag(:div, class: 'col-10 text-left') {
                    NfgUi::Components::Foundations::Typeface.new({ heading: title, icon: icon }, view_context).render
                  })
                  concat(content_tag(:div, class: 'col-2 text-right') {
                    NfgUi::Components::Foundations::Icon.new({ traits: ['caret-down fw'], tooltip: 'Show / hide additional information' }, view_context).render
                  })
                end
              })
            elsif title
              concat(NfgUi::Components::Foundations::Typeface.new({ heading: title, icon: icon }, view_context).render)
            end

            concat((block_given? ? yield : body))
          end
        end
      end
    end
  end
end
