# frozen_string_literal: true

module NfgUi
  module Components
    module Foundations
      # Grid doc coming soon
      class Illustration < NfgUi::Components::Base
        include Bootstrap::Utilities::Sizable
        include Bootstrap::Utilities::Tooltipable

        include NfgUi::Components::Traits::Size

        def image
          options.fetch(:image, nil)
        end

        def render
          return unless image.present?
          content_tag(:img, html_options.except(:image).merge!(src: view_context.image_path(image))) {}
          # image_tag(image_path(image), **html_options)

        end

        private

        def non_html_attribute_options
          super.push(:image)
        end
      end
    end
  end
end
