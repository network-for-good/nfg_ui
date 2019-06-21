# frozen_string_literal: true

module NfgUi
  module Components
    module Foundations
      # Image doc coming soon
      class Image < NfgUi::Components::Base
        include Bootstrap::Utilities::Tooltipable

        def css_classes
          [
            super,
            ('img-fluid' if responsive)
          ].join(' ').squish
        end

        # Prefer image, image is used
        # on other components that pull in
        # the image (e.g. Illustration)
        def image
          options.fetch(:image, nil)
        end

        def render
          image_tag(view_context.image_path(image || src || ''), **html_options)
        end

        # Flag if the image should utilize responsive settings or not.
        # This typically does thigns like
        # apply specific css classes (e.g.: 'img-fluid') to the rendered component
        def responsive
          options.fetch(:responsive, default_responsive)
        end

        # Allow :src to come through
        # since :src is a native and
        # viable to way source a image path / url
        def src
          options.fetch(:src, image)
        end

        private

        def component_css_class
          ''
        end

        def non_html_attribute_options
          super.push(:image, :src, :responsive)
        end

        def default_responsive
          true
        end
      end
    end
  end
end
