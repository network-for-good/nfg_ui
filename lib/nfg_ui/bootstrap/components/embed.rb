# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Responsive Embed Component
      # https://getbootstrap.com/docs/4.1/utilities/embed/
      class Embed < Bootstrap::Components::Base
        attr_reader :aspect_ratio

        def initialize(*)
          super
          @iframe = iframe if options[:iframe]
          @aspect_ratio = options.fetch(:aspect_ratio, default_aspect_ratio)
        end

        def iframe
          view_context.content_tag :iframe, nil, src: options[:iframe], class: 'embed-responsive-item', allowfullscreen: 'true'
        end

        private

        def component_css_class
          'embed-responsive'
        end

        def css_classes
          super + " embed-responsive-#{aspect_ratio.gsub("\:", 'by')}"
        end

        def allowed_aspect_ratios
          %w[21:9 16:9 4:3 1:1]
        end

        def default_aspect_ratio
          '16:9'
        end

        def default_iframe
          ''
        end

        def non_html_attribute_options
          super.push(:iframe, :aspect_ratio)
        end

        def defaults
          super.merge!(iframe: default_iframe,
                       aspect_ratio: default_aspect_ratio)
        end
      end
    end
  end
end
