# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Button Component
      # https://getbootstrap.com/docs/4.1/components/buttons/
      class Button < Bootstrap::Components::Base
        include Bootstrap::Utilities::Themeable
        include Bootstrap::Utilities::Sizable

        private

        def component_html_class
          'btn'
        end

        def default_html_wrapper_element
          :div
        end
      end
    end
  end
end
