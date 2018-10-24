# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Carousel Slide / Carousel Item Component
      # https://getbootstrap.com/docs/4.1/components/carousel/#slides-only
      class CarouselItem < Bootstrap::Components::Base
        include Bootstrap::Utilities::Activatable

        def component_family
          :carousel
        end

        def image
          options.fetch(:image, nil)
        end

        private

        def non_html_attribute_options
          super.push(:image)
        end
      end
    end
  end
end
