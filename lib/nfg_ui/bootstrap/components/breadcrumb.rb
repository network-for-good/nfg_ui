# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Breadcrumb Component
      # https://getbootstrap.com/docs/4.1/components/breadcrumb/
      class Breadcrumb < Bootstrap::Components::Base
        private

        def component_html_class
          'breadcrumb'
        end
      end
    end
  end
end
