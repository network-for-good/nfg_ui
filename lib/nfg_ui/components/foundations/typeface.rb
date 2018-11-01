# frozen_string_literal: true

module NfgUi
  module Components
    module Foundations
      # Typeface doc coming soon
      class Typeface < NfgUi::Components::Base
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable
        
        include Bootstrap::Utilities::Wrappable
        include Bootstrap::Utilities::Themeable
        include Bootstrap::Utilities::Tooltipable

        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Titleable

        include NfgUi::Components::Traits::Theme
        include NfgUi::Components::Traits::Typeface

        def heading
          options.fetch(:heading, nil)
        end

        def caption
          options.fetch(:caption, nil)
        end

        def text_or_icon
          icon ? view_context.ui.nfg(:icon, icon, text: text) : text
        end

        private

        def theme_css_class_prefix
          'text-'
        end

        def css_classes
          [
            super,
            ('font-size-sm' if caption)
          ].join(' ').squish
        end

        def default_theme
          nil
        end

        def text
          body || heading || title || caption
        end

        def automatic_as
          if body
            body_tag
          elsif heading
            heading_tag
          elsif title
            title_tag
          elsif caption
            caption_tag
          else
            super
          end
        end

        def component_css_class
          ''
        end

        def non_html_attribute_options
          super.push(:heading, :body, :title, :caption)
        end

        def caption_tag
          :p
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
