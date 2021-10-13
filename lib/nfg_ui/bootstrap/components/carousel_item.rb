# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Carousel Slide / Carousel Item Component
      # https://getbootstrap.com/docs/4.1/components/carousel/#slides-only
      class CarouselItem < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Activatable

        # Turn on or off auto scrolling carousel
        # NOTE: this does not yet work
        # SUSPECTED javascript bug
        # see bootstrap docs: https://getbootstrap.com/docs/4.3/components/carousel/#individual-carousel-item-interval
        def auto
          options.fetch(:auto, true)
        end

        def caption
          options.fetch(:caption, nil)
        end

        def component_family
          :carousel
        end

        def data
          # when auto is false, do not auto rotate carousel items
          # Otherwise, allow usage of the interval attribute
          # 'false' as a text string turns off transitions
          interval_val = auto == false ? 'false' : interval

          super.merge!(interval: interval_val)
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
