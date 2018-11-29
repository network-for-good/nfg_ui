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
