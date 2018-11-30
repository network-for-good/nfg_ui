# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Media Object Layout Component
      # https://getbootstrap.com/docs/4.1/layout/media-object/
      class MediaObject < NfgUi::Bootstrap::Components::Base
        def component_css_class
          ''
        end

        def component_family
          :media
        end

        def render
          (block_given? ? yield : body)
        end
      end
    end
  end
end
