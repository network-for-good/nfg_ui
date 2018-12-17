# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Badge Component
      # https://getbootstrap.com/docs/4.1/components/badge/
      class Badge < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Themeable
        include Bootstrap::Utilities::Wrappable

        def pill
          options.fetch(:pill, false)
        end

        private

        def base_element
          as #comes from the wrappable module
        end

        def css_classes
          [
            super,
            ("#{component_css_class}-pill" if pill)
          ].join(' ').squish
        end

        def default_html_wrapper_element
          :span
        end

        def non_html_attribute_options
          super.push(:pill)
        end
      end
    end
  end
end
