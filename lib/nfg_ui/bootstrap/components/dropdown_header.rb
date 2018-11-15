# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Dropdown Header Component
      # https://getbootstrap.com/docs/4.1/components/dropdowns/#headers
      class DropdownHeader < Bootstrap::Components::Base
        def heading
          options.fetch(:heading, '')
        end

        def component_family
          :dropdown
        end
      end
    end
  end
end
