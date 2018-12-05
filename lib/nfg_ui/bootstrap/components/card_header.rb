# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Card Header
      # https://getbootstrap.com/docs/4.1/components/card/#header-and-footer
      class CardHeader < NfgUi::Bootstrap::Components::Base
        def component_family
          :card
        end

        def heading
          options.fetch(:heading, nil)
        end

        def render
          content_tag(:div, html_options) do
            if heading.present?
              heading
            else
              (block_given? ? yield : body)
            end
          end
        end

        private

        def non_html_attribute_options
          super.push(:heading)
        end
      end
    end
  end
end
