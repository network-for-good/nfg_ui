# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Table Component
      # https://getbootstrap.com/docs/4.1/content/tables/
      class Table < NfgUi::Bootstrap::Components::Base
        def render
          content_tag(:table, html_options) do
            (block_given? ? yield : body)
          end
        end
      end
    end
  end
end
