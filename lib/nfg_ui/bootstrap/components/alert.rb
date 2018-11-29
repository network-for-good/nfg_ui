# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Alert Component
      # https://getbootstrap.com/docs/4.1/components/alerts/
      class Alert < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Dismissible
        include Bootstrap::Utilities::Headable
        include Bootstrap::Utilities::Themeable

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
