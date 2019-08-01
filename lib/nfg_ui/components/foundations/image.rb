# frozen_string_literal: true

module NfgUi
  module Components
    module Foundations
      # Image doc coming soon
      class Image < NfgUi::Components::Base
        include Bootstrap::Utilities::Tooltipable
        include Bootstrap::Utilities::Responsiveable
        include NfgUi::Components::Traits::Responsive

        # Prefer image, image is used
        # on other components that pull in
        # the image (e.g. Illustration)
        def image
          options.fetch(:image, nil)
        end

        def render
          image_tag(view_context.image_path(image_location), **html_options)
        end

        # Allow :src to come through
        # since :src is a native and
        # viable to way source a image path / url
        def src
          options.fetch(:src, image)
        end

        private

        def responsive_css_class
          'img-fluid'
        end

        def component_css_class
          ''
        end

        def default_responsive
          true
        end

        # Provide a fallback image location and default to src
        # :src will default to the :image option
        # if :src is not set.
        #
        # We prefer the :image keyword here because of its specificity and to pass between components.
        #
        # Ex: `:button, image: '...'`
        def image_location
          src || ''
        end

        # :src is removed because we leveage the #image_tag helper method.
        #
        # the image_tag helper method automatically turns the first argument into the `src` attribute.
        def non_html_attribute_options
          super.push(:image, :src)
        end
      end
    end
  end
end
