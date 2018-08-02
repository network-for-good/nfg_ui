# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Badge Component
      # https://getbootstrap.com/docs/4.1/components/badge/
      class Badge < Bootstrap::Components::Base
        include Bootstrap::Utilities::Themeable
        # include Bootstrap::Utilities::Wrappable

        private

        def pill
          options.fetch(:pill, default_pill)
        end

        def css_classes
          pill ? super + " #{component_css_class}-pill" : super
        end

        def default_pill
          false
        end

        def non_html_attribute_options
          pill ? super.push(:pill) : super
        end

        # def default_html_wrapper_element
        #   :span
        # end
      end
    end
  end
end
