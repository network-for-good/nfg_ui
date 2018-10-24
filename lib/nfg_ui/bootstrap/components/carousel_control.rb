# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Carousel Control Component
      # https://getbootstrap.com/docs/4.1/components/carousel/#with-controls
      class CarouselControl < Bootstrap::Components::Base
        def component_family
          :carousel
        end
      end
    end
  end
end
