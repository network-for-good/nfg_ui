module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Collapse Component
      # https://getbootstrap.com/docs/4.1/components/collapse/
      class Collapse < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Collapsible
        # def collapsed
        #   options.fetch(:collapsed, false)
        # end

        def navbar
          options.fetch(:navbar, false)
        end

        def render
          content_tag(:div, html_options) do
            (block_given? ? yield : body)
          end
        end

        private

        def css_classes
          [
            super,
            ('show' unless collapsed || navbar),
            ('navbar-collapse' if navbar)
          ].join(' ').squish
        end

        def non_html_attribute_options
          super.push(:collapsed, :navbar)
        end
      end
    end
  end
end
