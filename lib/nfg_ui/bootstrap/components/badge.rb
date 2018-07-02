# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Badge Component
      # https://getbootstrap.com/docs/4.1/components/badge/
      class Badge < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Themeable

        private

        def component_html_class
          'badge'
        end
      end
    end
  end
end
