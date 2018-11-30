# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Jumbotron Component
      # https://getbootstrap.com/docs/4.1/components/jumbotron/
      class Jumbotron < NfgUi::Bootstrap::Components::Base
        def render
          content_tag(:div, html_options) do
            (block_given? ? yield : body)
          end
        end
      end
    end
  end
end
