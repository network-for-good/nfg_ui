# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Modal Component
      # https://getbootstrap.com/docs/4.1/components/modal/
      class ModalHeader < Bootstrap::Components::Base

        def component_family
          :modal
        end

        def title
          p "====== Printed from: (Bootstrap::Components::ModalHeader) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:title, nil)
        end

        private

        def non_html_attribute_options
          p "====== Printed from: (Bootstrap::Components::ModalHeader) self.class.name: #{self.class.name} method: #{__method__}"
          super.push(:title)
        end
      end
    end
  end
end
