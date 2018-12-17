# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Carousel Control Component
      # https://getbootstrap.com/docs/4.1/components/carousel/#with-controls
      class CarouselControl < NfgUi::Bootstrap::Components::Base
        # CarouselControl does not get adjustable body content
        def body
          nil
        end

        def component_family
          :carousel
        end

        def carousel
          options.fetch(:carousel, nil)
        end

        # Options for control are :prev and :next
        # control's value sets up the rest of the carousel control attributes in HTML
        def control
          options.fetch(:control, nil)
        end

        def data
          control ? super.merge!(slide: control) : super
        end

        def href
          carousel ? carousel : '#'
        end

        def icon_html_options
          return {} unless control
          { class: "carousel-control-#{control}-icon", aria: { hidden: true } }
        end

        def render
          super do
            capture do
              if control
                concat(content_tag(:span, nil, icon_html_options))
                concat(content_tag(:span, control.to_s, class: 'sr-only'))
              end
            end
          end
        end

        private

        def base_element
          :a
        end

        def assistive_html_attributes
          super.merge!(role: 'button')
        end

        # next is a reserved word, for here, we'll refer to options[:next]
        def component_css_class
          control ? "#{super}-#{control}" : super
        end

        def non_html_attribute_options
          super.push(:control, :carousel)
        end
      end
    end
  end
end
