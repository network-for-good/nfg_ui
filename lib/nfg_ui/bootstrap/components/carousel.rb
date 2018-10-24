# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Carousel Component
      # https://getbootstrap.com/docs/4.1/components/carousel/
      class Carousel < Bootstrap::Components::Base
        def component_family
          :carousel
        end

        def data
          super.merge!(ride: 'carousel')
        end

        private

        def css_classes
          [
            super,
            'slide'
          ].join(' ').squish
        end
      end
    end
  end
end
