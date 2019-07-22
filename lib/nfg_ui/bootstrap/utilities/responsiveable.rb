# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      module Responsiveable
        # Setting #responsive to true will supply the component with, at minimum,
        # a '[component-name]-responsive' css class (e.g.: 'table-responsive')
        def responsive
          options.fetch(:responsive, default_responsive)
        end

        private

        def css_classes
          [
            super,
            (responsive_css_class if responsive)
          ].join(' ').squish
        end

        def responsive_css_class
          "#{component_css_class}-responsive"
        end

        def default_responsive
          @default_responsive ||= false
        end

        def non_html_attribute_options
          super.push(:responsive)
        end
      end
    end
  end
end
