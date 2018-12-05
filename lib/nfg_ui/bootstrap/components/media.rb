# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Media Object Layout Component
      # https://getbootstrap.com/docs/4.1/layout/media-object/
      class Media < NfgUi::Bootstrap::Components::Base
        def component_family
          :media
        end

        def render
          content_tag :div, html_options do
            (block_given? ? yield : body)
          end
        end
      end
    end
  end
end
