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

        def button
          options.fetch(:button, nil)
        end

        def href
          options.fetch(:href, nil)
        end

        def subtitle
          options.fetch(:subtitle, nil)
        end

        def render
          super do
            if title
              concat(content_tag(:div, class: 'row') do
                concat(content_tag(:div, class: "col #{'pr-0' if collapsible}") do
                    content_tag(:div, class: 'row') do
                      concat(content_tag(:div, class: 'col-12 col-md') do
                        concat(NfgUi::Components::Foundations::Typeface.new({ heading: title, icon: icon, class: 'h4' }, view_context).render)
                        if subtitle
                          concat(NfgUi::Components::Foundations::Typeface.new({ body: subtitle, traits: [:muted], class: 'mt-1 mb-0' }, view_context).render)
                        end
                      end
                      )

                      if button
                        concat(content_tag(:div, class: 'col-12 col-md-auto mt-md-0 mt-2') do
                          NfgUi::Components::Elements::Button.new({theme: :secondary, href: href, body: button}, view_context).render

                          end
                        )
                      end
                    end
                  end
                )

                if collapsible
                  concat(content_tag(:div, class: 'col-auto pl-0') do
                    NfgUi::Components::Elements::Button.new({ traits: [:link], collapse: collapse, class: 'ml-2', data: { collapse_icon: collapse_icon, collapsed_icon: collapsed_icon } }, view_context).render {

                      # The button cannot host a data-toggle for tooltip and a data-toggle for collapse

                      # In order to accomodate the tooltip, we have to render the icon manually outside of the button so we're applying the tooltip on the icon and not the button.
                      NfgUi::Components::Foundations::Icon.new({ traits: ["#{contextual_collapsible_icon} fw"], tooltip: 'Show / hide additional information' }, view_context).render
                    }
                    end
                  )
                end
              end
              )
            end
            concat((block_given? ? yield : body))
            # if collapsible && title
            #   concat(NfgUi::Components::Elements::Button.new({ traits: [:link, :block], collapse: collapse, class: 'no-link-color p-0 m-0', data: { collapse_icon: collapse_icon, collapsed_icon: collapsed_icon } }, view_context).render {
            #     content_tag(:div, class: 'row align-items-center') do
            #       concat(content_tag(:div, class: 'col-10 text-left') {
            #         NfgUi::Components::Foundations::Typeface.new({ heading: title, icon: icon, class: 'h4' }, view_context).render
            #       })
            #       concat(content_tag(:div, class: 'col-2 text-right') {
            #         NfgUi::Components::Foundations::Icon.new({ traits: ["#{contextual_collapsible_icon} fw"], tooltip: 'Show / hide additional information' }, view_context).render
            #       })
            #     end
            #   })
            # elsif title
            #   concat(NfgUi::Components::Foundations::Typeface.new({ heading: title, icon: icon, class: 'h4' }, view_context).render)
            # end

            # concat((block_given? ? yield : body))
          end
        end

        private

        def contextual_collapsible_icon
          return '' unless collapsible
          collapsed ? collapsed_icon : collapse_icon
        end

        def collapse_icon
          'caret-up'
        end

        def collapsed_icon
          'caret-down'
        end

        def non_html_attribute_options
          super.push(:subtitle, :button, :href)
        end
      end
    end
  end
end
