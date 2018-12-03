# frozen_string_literal: true

module NfgUi
  module Components
    module Foundations
      # Typeface doc coming soon
      class Typeface < NfgUi::Components::Base
        include Bootstrap::Utilities::Wrappable
        include Bootstrap::Utilities::Themeable
        include Bootstrap::Utilities::Tooltipable

        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Titleable

        include NfgUi::Components::Traits::Muted
        include NfgUi::Components::Traits::Theme
        include NfgUi::Components::Traits::Typeface

        def render
          content_tag(as, **html_options) do
            if icon
              NfgUi::Components::Foundations::Icon.new({ icon: icon, text: body }, view_context).render
            else
              body
            end
          end
        end

        def as
          if heading
            heading_tag
          elsif subheading
            subheading_tag
          elsif title
            title_tag
          elsif caption
            caption_tag
          else
            super
          end
        end

        def heading
          options.fetch(:heading, nil)
        end

        def subheading
          options.fetch(:subheading, nil)
        end

        def caption
          options.fetch(:caption, nil)
        end

        def body
          super || heading || title || caption || subheading
        end

        # def text_or_icon
        #   icon ? view_context.ui.nfg(:icon, icon, text: text) : text
        # end

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

        def component_css_class
          ''
        end

        def non_html_attribute_options
          super.push(:heading, :body, :title, :caption, :subheading)
        end

        def caption_tag
          :p
        end

        def body_tag
          :p
        end

        def heading_tag
          :h5
        end

        def title_tag
          :h6
        end

        def subheading_tag
          :h6
        end

        def default_html_wrapper_element
          body_tag
        end

        def outlineable?
          false
        end
      end
    end
  end
end
