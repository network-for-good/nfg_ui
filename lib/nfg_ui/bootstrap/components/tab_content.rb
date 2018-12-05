# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Progress Component
      # https://getbootstrap.com/docs/4.1/components/progress/
      class TabContent < NfgUi::Bootstrap::Components::Base
        def component_family
          :tab
        end

        def render
          content_tag(:div, html_options) do
            (block_given? ? yield : body)
          end
        end
      end
    end
  end
end
