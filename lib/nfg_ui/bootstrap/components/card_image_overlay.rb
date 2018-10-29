# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Card Header
      # https://getbootstrap.com/docs/4.1/components/card/#header-and-footer
      class CardImageOverlay < Bootstrap::Components::Base
        include NfgUi::Components::Utilities::Titleable

        def component_family
          :card
        end

        def image
          options.fetch(:image, '')
        end

        private

        def component_css_class
          'card-img-overlay'
        end

        def non_html_attribute_options
          super.push(:image)
        end
      end
    end
  end
end
