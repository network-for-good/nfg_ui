# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Carousel doesn't have any customizations unique to the design system yet
      # As such, the NFG UI carousel is simply a bootstrap carousel behind the scenes.
      # Traits will eventually be connected here.
      class Carousel < NfgUi::Bootstrap::Components::Carousel
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        # Turn on or off auto scrolling carousel
        def auto
          options.fetch(:auto, true)
        end

        def data
          # false on auto means that the carousel should not automatically rotate.
          data_val = auto == false ? { interval: 'false' } : { ride: 'carousel' }

          options[:data].merge!(**data_val)
        end

        def render
          content_tag(:div, html_options) do
            concat(
              content_tag(:div, class: 'carousel-inner') do
                concat((block_given? ? yield : body))
              end
            )
            if controls
              concat(NfgUi::Components::Elements::CarouselControl.new({ control: :next, carousel: "##{id}" }, view_context).render)
              concat(NfgUi::Components::Elements::CarouselControl.new({ control: :prev, carousel: "##{id}" }, view_context).render)
            end
            if indicators > 0
              concat(NfgUi::Components::Elements::CarouselIndicators.new({ count: indicators, carousel: "##{id}" }, view_context).render)
            end
          end
        end

        def non_html_attribute_options
          super.push(:auto)
        end
      end
    end
  end
end
