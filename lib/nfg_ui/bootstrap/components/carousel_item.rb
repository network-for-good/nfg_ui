# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Carousel Slide / Carousel Item Component
      # https://getbootstrap.com/docs/4.1/components/carousel/#slides-only
      class CarouselItem < Bootstrap::Components::Base
        def component_family
          :carousel
        end
      end
    end
  end
end
