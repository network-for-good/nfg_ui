# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Main slats
      class Slat < NfgUi::Components::Base
        def component_family
          :slats
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
