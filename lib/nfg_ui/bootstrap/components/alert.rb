# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Alert Component
      class Alert < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Dismissible
        include Bootstrap::Utilities::Headable
        include Bootstrap::Utilities::Themeable

        def render
          content_tag(:div, html_options) do
            capture do
              if dismissible
                concat(
                  NfgUi::Bootstrap::Components::Button.new({ as: :button, class: 'close', theme: nil, data: { dismiss: 'alert' }, aria: { label: 'Close' } }, view_context).render do
                    content_tag(:span, "&times;".html_safe, aria: { hidden: 'true' } )
                  end
                )
              end
              if heading
                concat(content_tag(:h4, heading, class: 'alert-heading'))
              end
              concat(block_given? ? yield : body)
            end
          end
        end

        private

        def assistive_html_attributes
          super.merge!(role: 'alert')
        end

        def css_classes
          [
            super,
            ("#{component_css_class}-dismissible" if dismissible),
            ('fade' if dismissible),
            ('show' if dismissible)
          ].join(' ').squish
        end

        def outlineable?
          false
        end
      end
    end
  end
end
