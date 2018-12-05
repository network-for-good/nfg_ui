# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Table Component
      # https://getbootstrap.com/docs/4.1/content/tables/
      class Table < NfgUi::Bootstrap::Components::Base
        private

        def base_element
          :table
        end
      end
    end
  end
end
