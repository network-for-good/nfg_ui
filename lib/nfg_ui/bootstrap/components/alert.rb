# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Alert Component
      # https://getbootstrap.com/docs/4.1/components/alerts/
      class Alert < Bootstrap::Components::Base
        include Bootstrap::Utilities::Themeable
        include Bootstrap::Utilities::Dismissible

        private

        def assistive_html_attributes
          super.merge!(role: 'alert')
        end

        def css_classes
          [
            super,
            ('fade' if dismissible),
            ('show' if dismissible)
          ].join(' ').squish
        end
      end
    end
  end
end
