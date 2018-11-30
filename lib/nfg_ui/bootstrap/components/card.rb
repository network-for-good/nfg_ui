# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Card Component
      # https://getbootstrap.com/docs/4.1/components/cards/
      class Card < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Themeable

        def component_family
          :card
        end

        def footer
          options.fetch(:footer, '')
        end

        def heading
          options.fetch(:heading, '')
        end

        def subtitle
          options.fetch(:subtitle, '')
        end

        def title
          options.fetch(:title, '')
        end

        def render
          content_tag(:div, html_options) do
            if heading.present?
              concat(NfgUi::Bootstrap::Components::CardHeader.new({ heading: heading }, view_context).render)
            end

            concat(NfgUi::Bootstrap::Components::CardBody.new({}, view_context).render {
              capture do
                concat(content_tag(:h5, title, class: 'card-title')) if title.present?
                concat(content_tag(:h6, subtitle, class: 'card-subtitle')) if subtitle.present?
                concat(block_given? ? yield : body)
              end
            })

            if footer.present?
              concat(NfgUi::Bootstrap::Components::CardFooter.new({ body: footer }, view_context).render)
            end
          end
        end

        private

        def css_classes
          return super unless theme.presence && theme != :light
          [
            super,
            (outlined ? "text-#{theme}" : 'text-white')
          ].join(' ').squish
        end

        def default_theme
          nil
        end

        def non_html_attribute_options
          super.push(:footer, :heading, :subtitle, :title)
        end

        def outlined_css_class_prefix
          'border-'
        end

        def theme_css_class_prefix
          outlined ? '' : 'bg-'
        end
      end
    end
  end
end
