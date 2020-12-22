# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Slat doc coming soon
      class SlatItem < NfgUi::Components::Base
        include Bootstrap::Utilities::Headable
        include Bootstrap::Utilities::Sizable

        include NfgUi::Components::Traits::Size
        include NfgUi::Components::Traits::SlatItem

        def caption
          options.fetch(:caption, nil)
        end

        def component_family
          :slats
        end

        def slat_header
          options.fetch(:slat_header, nil)
        end

        # Leverage custom tooltip implementation
        # so that tooltips are connected to slat item text
        # and not the slat item containing div (resulting in better UI)
        def tooltip
          options.fetch(:tooltip, nil)
        end

        def render
          content_tag(base_element, slat_item_html_options) do
            if slat_header
              concat(content_tag(:h6, slat_header, class: 'display-4 slat-column-header', **tooltip_html_options))
            end
            if heading
              if href
                concat(content_tag(:a, href: view_context.url_for(href)) {
                  NfgUi::Components::Foundations::Typeface.new({ subheading: heading, tooltip: tooltip }, view_context).render
                })
              else
                concat(NfgUi::Components::Foundations::Typeface.new({ subheading: heading, tooltip: tooltip }, view_context).render)
              end
            end
            concat(block_given? ? yield : body)
            if caption
              concat(NfgUi::Components::Foundations::Typeface.new({ caption: caption, class: 'mb-0', tooltip: (tooltip unless heading) }, view_context).render)
            end
          end
        end

        private

        def tooltip_html_options
          return {} unless tooltip
          { title: tooltip, data: options[:data].merge(tooltip_data_attributes) }
        end

        def tooltip_data_attributes
          { toggle: 'tooltip',
            placement: :top,
            html: 'true' }
        end

        # Strip the href from html_options and pass it to the header
        def slat_item_html_options
          options = html_options.except(:href)

          # merge in tooltip only if leveraging block body content
          options.merge!(tooltip_html_options) unless (heading || caption || slat_header)

          options
        end

        # :sm is the default size, and is not given
        # a `slat-item-sm` class name.
        # thus, reject :sm from resizable symbols.
        def resized?
          [:md, :lg, :xl].include?(size)
        end

        def non_html_attribute_options
          super.push(:slat_header, :caption, :tooltip)
        end
      end
    end
  end
end
