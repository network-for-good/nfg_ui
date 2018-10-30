# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Responsive Embed Component
      # https://getbootstrap.com/docs/4.1/utilities/embed/
      class Embed < Bootstrap::Components::Base
        def aspect_ratio
          options.fetch(:aspect_ratio, default_aspect_ratio) || default_aspect_ratio
        end

        def iframe
          return unless iframe?
          view_context.content_tag :iframe, nil, src: src, class: 'embed-responsive-item', allowfullscreen: true
        end

        def iframe?
          options[:iframe].present?
        end

        def autoplay
          options.fetch(:autoplay, default_autoplay)
        end

        private

        def component_css_class
          'embed-responsive'
        end

        def src
          return unless iframe?
          options[:iframe] + (autoplay ? '?autoplay=1' : '')
        end

        def css_classes
          return super unless allowed_aspect_ratios.include?(aspect_ratio)
          super + " embed-responsive-#{aspect_ratio.gsub("\:", 'by')}"
        end

        def allowed_aspect_ratios
          %w[21:9 16:9 4:3 1:1]
        end

        def default_aspect_ratio
          '16:9'
        end

        # def default_iframe
        #   ''
        # end

        def non_html_attribute_options
          super.push(:iframe, :aspect_ratio, :autoplay)
        end

        # def defaults
        #   super.merge!(iframe: default_iframe,
        #                aspect_ratio: default_aspect_ratio,
        #                autoplay: default_autoplay)
        # end

        def default_autoplay
          false
        end
      end
    end
  end
end
