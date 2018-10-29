# frozen_string_literal: true

module NfgUi
  module Components
    module Foundations
      # Typeface doc coming soon
      class Typeface < NfgUi::Components::Base
        include Bootstrap::Utilities::Wrappable
        include Bootstrap::Utilities::Themeable

        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Titleable

        include NfgUi::Components::Traits::Theme

        def heading
          options.fetch(:heading, nil)
        end

        def text_or_icon
          icon ? view_context.ui.nfg(:icon, icon, text: text) : text
        end

        private

        def theme_css_class_prefix
          'text-'
        end

        def default_theme
          nil
        end

        def text
          body || heading || title
        end

        def automatic_as
          if body
            body_tag
          elsif heading
            heading_tag
          elsif title
            title_tag
          else
            super
          end
        end

        def component_css_class
          ''
        end

        def non_html_attribute_options
          super.push(:heading, :body, :title)
        end

        def body_tag
          :p
        end

        def heading_tag
          :h4
        end

        def title_tag
          :h6
        end
      end
    end
  end
end
