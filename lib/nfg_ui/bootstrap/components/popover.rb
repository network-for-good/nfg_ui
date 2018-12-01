# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Popover Component
      # https://getbootstrap.com/docs/4.1/components/popovers/
      class Popover < NfgUi::Bootstrap::Components::Base
      end

      def render
        content_tag(:div, html_options) do
          (block_given? ? yield : body)
        end
      end
    end
  end
end
