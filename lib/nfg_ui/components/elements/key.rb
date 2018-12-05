# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Key doc coming soon
      class Key < NfgUi::Components::Base
        def render
          content_tag(:div, html_options) do
            (block_given? ? yield : body)
          end
        end
      end
    end
  end
end
