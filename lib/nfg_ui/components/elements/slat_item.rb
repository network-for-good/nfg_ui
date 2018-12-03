# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Slat doc coming soon
      class SlatItem < NfgUi::Components::Base
        include Bootstrap::Utilities::Headable
        include Bootstrap::Utilities::Sizable

        include NfgUi::Components::Traits::Size

        def component_family
          :slats
        end

        def slat_header
          options.fetch(:slat_header, nil)
        end

        def caption
          options.fetch(:caption, nil)
        end

        def render
          content_tag(:div, html_options) do
            if slat_header
              concat(content_tag(:h6, slat_header, class: 'display-4'))
            end
            if heading
              if href
                concat(content_tag(:a, href: href) {
                  NfgUi::Components::Foundations::Typeface.new({ subheading: heading }, view_context).render
                })
              else
                concat(NfgUi::Components::Foundations::Typeface.new({ subheading: heading }, view_context).render)
              end
            end
            concat(block_given? ? yield : body)
            if caption
              concat(NfgUi::Components::Foundations::Typeface.new({ caption: caption, class: 'mb-0' }, view_context).render)
            end
          end
        end

        private

        def css_classes
          [
            super,
            ('text-word-wrap' if size == :lg)
          ]
        end

        def non_html_attribute_options
          super.push(:slat_header, :caption)
        end
      end
    end
  end
end
