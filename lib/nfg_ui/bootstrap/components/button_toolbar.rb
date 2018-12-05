# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Button Toolbar Component
      # https://getbootstrap.com/docs/4.1/components/button-group/#button-toolbar
      class ButtonToolbar < NfgUi::Bootstrap::Components::Base
        def render
          content_tag(:div, html_options) do
            (block_given? ? yield : body)
          end
        end

        private

        def component_css_class
          'btn-toolbar'
        end

        def assistive_html_attributes
          super.merge!(role: 'toolbar')
        end
      end
    end
  end
end
