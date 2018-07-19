# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Breadcrumb Item
      # Subcomponent of Breadcrumb
      # https://getbootstrap.com/docs/4.1/components/breadcrumb/
      class BreadcrumbItem < Bootstrap::Components::Base
        include Bootstrap::Utilities::Activatable
        include Bootstrap::Utilities::AriaAssistable

        def initialize(*)
          super
          build_aria(aria_key: :current, aria_value: 'page') if active?
        end

        def component_family
          :breadcrumb
        end
      end
    end
  end
end
