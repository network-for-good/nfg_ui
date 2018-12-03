# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Pagination Component
      # https://getbootstrap.com/docs/4.1/components/pagination/
      class Pagination < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Alignable
        include Bootstrap::Utilities::Sizable

        def component_family
          :pagination
        end

        def render
          content_tag(:nav) do
            content_tag(:ul, html_options) do
              (block_given? ? yield : body)
            end
          end
        end
      end
    end
  end
end
