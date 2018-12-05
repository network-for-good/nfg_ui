# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Carousel Indicators Component
      # https://getbootstrap.com/docs/4.1/components/carousel/#with-indicators
      class CarouselIndicators < NfgUi::Bootstrap::Components::Base
        def active
          options.fetch(:active, 1) # allow nil so that no indicator is active if desired
        end

        # Carousel Indicators do not accept a body
        def body
          nil
        end

        def component_family
          :carousel
        end

        def count
          options[:count] || 0 # return 0 when nil
        end

        def carousel
          options.fetch(:carousel, nil)
        end

        def render
          content_tag(:ol, html_options) do
            count.times do |i|
              concat(content_tag(:li, nil, class: ('active' if active == i + 1), data: { target: carousel, slide_to: i }))
            end
          end
        end

        private

        def non_html_attribute_options
          super.push(:active,
                     :count,
                     :carousel)
        end
      end
    end
  end
end
