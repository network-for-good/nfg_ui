module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Collapse Component
      class Collapse < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Collapsible

        def navbar
          options.fetch(:navbar, false)
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
