# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # PageHeader doc coming soon
      class PageHeader < NfgUi::Components::Base
        include NfgUi::Components::Utilities::BrowserDetectable
        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Renderable
        include NfgUi::Components::Utilities::ResourceThemeable
        include NfgUi::Components::Utilities::Titleable

        include NfgUi::Components::Traits::PageHeader

        def data
          sticky ? super.merge!(toggle: 'sticky-div') : super
        end

        # Supplies a slightly smaller design-system approved column structure
        # when set to false (as used in Evo), by default.
        # DMS, however requires a simple 'col' (full width) layout
        # and will have :full_width set to true manually while both apps
        # co-exist with slightly different page layouts.
        def full_width
          options.fetch(:full_width, false)
        end

        def sticky
          return if Rails.env.test? || browser.mobile?
          options.fetch(:sticky, true)
        end

        def subtitle
          options.fetch(:subtitle, nil)
        end

        def resource_theme_icon
          # Prefer :icon in options over resource_theme_icon autolookup
          # #icon is made available by Iconable,
          # effectively allowing `icon: 'example'` to overwrite
          # the auto resource_theme_icon version.
          return icon if icon.present?
          super
        end

        def render
          html_options[:class] ||= ''
          html_options[:class] << ' container-fluid'

          content_tag(:div, html_options) do
            content_tag(:div, class: 'row') do
              content_tag(:div, class: column_structure_css_classes) do
                content_tag(:div, class: 'row align-items-center') do
                  concat(content_tag(:div, class: 'col py-2') {
                    NfgUi::Components::Patterns::Media.new({}, view_context).render do
                      capture do
                        concat(NfgUi::Components::Elements::MediaObject.new({}, view_context).render {
                          content_tag(:div, class: 'mt-lg-1 mr-2 h3') do
                            NfgUi::Components::Foundations::Icon.new({ traits: [resource_theme_icon], class: "text-#{resource_theme_color} mr-0" }, view_context).render
                          end
                        })
                        concat(NfgUi::Components::Elements::MediaBody.new({}, view_context).render {
                          content_tag(:h1) do
                            if subtitle
                              concat(content_tag(:span, title, class: 'mr-2'))
                              concat(content_tag(:small, subtitle, class: 'text-muted'))

                            else
                              concat(title)
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

        def column_structure_css_classes
          "col #{'col-xl-11 mx-auto' unless full_width}".squish
        end

        def non_html_attribute_options
          super.push(:subtitle, :full_width, :sticky)
        end
      end
    end
  end
end
