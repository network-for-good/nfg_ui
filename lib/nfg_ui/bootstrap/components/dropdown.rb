# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Dropdown Component
      # https://getbootstrap.com/docs/4.1/components/dropdowns/
      class Dropdown < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::DropdownDirectionable

        def button
          options.fetch(:button, '')
        end

        def component_family
          :dropdown
        end

        def offset
          options.fetch(:offset, '')
        end

        def theme
          options.fetch(:theme, NfgUi::DEFAULT_BOOTSTRAP_THEME)
        end

        private

        def non_html_attribute_options
          super.push(:theme,
                     :button,
                     :offset,
                     :dropleft,
                     :dropright,
                     :dropup)
        end
      end
    end
  end
end
