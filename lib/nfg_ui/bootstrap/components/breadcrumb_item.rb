# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Breadcrumb Item
      # Subcomponent of Breadcrumb
      # https://getbootstrap.com/docs/4.1/components/breadcrumb/
      class BreadcrumbItem < Bootstrap::Components::Base
        include Bootstrap::Utilities::Activatable

        private

        def parent_component
          :breadcrumb
        end

        def component_html_class
          'breadcrumb-item'
        end

        def assistive_html_attributes
          active? ? { aria: { current: 'page' } } : {}
        end
      end
    end
  end
end
