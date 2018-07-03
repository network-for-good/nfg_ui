# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Breadcrumb Item
      # Subcomponent of Breadcrumb
      # https://getbootstrap.com/docs/4.1/components/breadcrumb/
      class BreadcrumbItem < NfgUi::Bootstrap::Components::Base
        def active?
          options.fetch(:active, default_active)
        end

        private

        def default_active
          false
        end

        def parent_component
          :breadcrumb
        end

        def component_html_class
          'breadcrumb-item'
        end
      end
    end
  end
end
