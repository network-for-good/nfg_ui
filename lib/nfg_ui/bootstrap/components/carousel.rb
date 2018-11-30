# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Carousel Component
      # https://getbootstrap.com/docs/4.1/components/carousel/
      class Carousel < NfgUi::Bootstrap::Components::Base
        def component_family
          :carousel
        end

        def controls
          options.fetch(:controls, false)
        end

        def data
          super.merge!(ride: 'carousel')
        end

        def indicators
          options[:indicators] || 0 # return 0 on nil
        end

        def render
          content_tag(:div, html_options) do
            content_tag(:div, class: 'carousel-inner') do
              if indicators > 0
                concat(NfgUi::Bootstrap::Components::CarouselIndicators.new({ count: indicators, carousel: "##{id}" }, view_context).render)
              end
              concat(block_given? ? yield : body)
              if controls
                concat(NfgUi::Bootstrap::Components::CarouselControl.new({ control: :next, carousel: "##{id}" }, view_context).render)
                concat(NfgUi::Bootstrap::Components::CarouselControl.new({ control: :prev, carousel: "##{id}" }, view_context).render)
              end
            end
          end
        end

        private

        def css_classes
          [
            super,
            'slide'
          ].join(' ').squish
        end

        def non_html_attribute_options
          super.push(:indicators, :controls)
        end
      end
    end
  end
end
