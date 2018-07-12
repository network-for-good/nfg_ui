# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed typeface traits
      module Typeface
        attr_reader :text

        private

        def trait_heading
          view_context.content_tag :h4, text_maybe_with_icon, html_options
        end

        def trait_title
          view_context.content_tag :h6, text_maybe_with_icon, html_options
        end

        def trait_body
          view_context.content_tag :p, text, html_options
        end
      end
    end
  end
end
