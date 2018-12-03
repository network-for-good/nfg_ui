# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # PageHeader doc coming soon
      class PageHeader < NfgUi::Components::Base
        include NfgUi::Components::Utilities::Titleable
        include NfgUi::Components::Utilities::BrowserDetectable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::PageHeader

        def data
          sticky ? super.merge!(toggle: 'sticky-div') : super
        end

        def sticky
          return if Rails.env.test? || browser.mobile?
          options.fetch(:sticky, true)
        end

        def subtitle
          options.fetch(:subtitle, nil)
        end

        # TODO: These resource_theme methods are just temporary placeholders.
        # They need to come from ResourceThemeable somehow.
        def resource_theme_icon
          'heart-o'
        end

        def resource_theme_color
          'primary'
        end

        def render
          content_tag(:div, class: 'container-fluid', **html_options) do
            content_tag(:div, class: 'row') do
              content_tag(:div, class: 'col col-xl-11 mx-auto') do
                content_tag(:div, class: 'row align-items-center') do
                  concat(content_tag(:div, class: 'col py-2') {
                    NfgUi::Components::Patterns::Media.new({}, view_context).render do
                      capture do
                        concat(NfgUi::Components::Elements::MediaObject.new({}, view_context).render {
                          content_tag(:div, class: 'mr-2 h2') do
                            NfgUi::Components::Foundations::Icon.new({ traits: [resource_theme_icon], class: "text-#{resource_theme_color} mr-0" }, view_context).render
                          end
                        })
                        concat(NfgUi::Components::Elements::MediaBody.new({}, view_context).render {
                          content_tag(:h2) do
                            concat(title)
                            if subtitle
                              concat(content_tag(:small, subtitle, class: 'text-muted'))
                            end
                          end
                        })
                      end
                    end
                  })
                  if body
                    concat(content_tag(:div, class: 'col-12 col-md-auto py-2') {
                      NfgUi::Components::Patterns::ButtonToolbar.new({ class: 'align-items-center' }, view_context).render do
                        (block_given? ? yield : body)
                      end
                    })
                  end
                end
              end
            end
          end
        end

        private

        def non_html_attribute_options
          super.push(:subtitle)
        end
      end
    end
  end
end
