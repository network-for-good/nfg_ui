# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Carousel Slide / Carousel Item Component
      # https://getbootstrap.com/docs/4.1/components/carousel/#slides-only
      class CarouselItem < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Activatable

        def caption
          options.fetch(:caption, nil)
        end

        def component_family
          :carousel
        end

        def data
          return super unless interval
          super.merge!(interval: interval)
        end

        def image
          options.fetch(:image, nil)
        end

        # manually pass in an interval numerical value
        # which translates to miliseconds between carousel item
        # slide transitions.
        # ex: interval: 5000
        def interval
          options[:interval] || nil
        end

        def label
          options.fetch(:label, nil)
        end

        def render
          super do
            capture do
              concat(image_tag(image, class: 'd-block w-100')) if image
              if caption || label
                concat(NfgUi::Bootstrap::Components::CarouselCaption.new({ body: caption, label: label }, view_context).render)
              end
              concat(block_given? ? yield : body)
            end
          end
        end

        private

        def non_html_attribute_options
          super.push(:image,
                     :caption,
                     :label,
                     :auto,
                     :interval)
        end
      end
    end
  end
end
