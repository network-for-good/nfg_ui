# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # SlatList doc coming soon
      class SlatList < NfgUi::Components::Base
        include Bootstrap::Utilities::Sizable

        include NfgUi::Components::Traits::Size

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
