# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap List Group Component
      # https://getbootstrap.com/docs/4.1/components/list-group/
      class ListGroup < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Wrappable

        def component_family
          :list_group
        end

        def flush
          options.fetch(:flush, false)
        end

        private

        def css_classes
          flush ? super + " #{component_css_class}-flush" : super
        end

        def default_html_wrapper_element
          :ul
        end

        def non_html_attribute_options
          super.push(:flush)
        end
      end
    end
  end
end
