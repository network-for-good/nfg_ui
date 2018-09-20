# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Breadcrumb Item
      # Subcomponent of Breadcrumb
      # https://getbootstrap.com/docs/4.1/components/breadcrumb/
      class BreadcrumbItem < Bootstrap::Components::Base
        include Bootstrap::Utilities::Activatable

        # def initialize(*)
        #   super
        #   build_aria(aria_key: :current, aria_value: 'page') if active?
        # end

        def component_family
          p "====== Printed from: (Bootstrap::Components::BreadcrumbItem) self.class.name: #{self.class.name} method: #{__method__}"
          :breadcrumb
        end

        private

        def assistive_html_attributes
          p "====== Printed from: (Bootstrap::Components::BreadcrumbItem) self.class.name: #{self.class.name} method: #{__method__}"
          active ? super.merge!(aria: { current: 'page' }) : super
        end
      end
    end
  end
end
