# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Breadcrumb Component
      # https://getbootstrap.com/docs/4.1/components/breadcrumb/
      class Breadcrumb < Bootstrap::Components::Base
        def component_family
          p "====== Printed from: (Bootstrap::Components::Breadcrumb) self.class.name: #{self.class.name} method: #{__method__}"
          :breadcrumb
        end
      end
    end
  end
end
