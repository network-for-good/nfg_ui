# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Modal Component
      # https://getbootstrap.com/docs/4.1/components/modal/
      class Modal < Bootstrap::Components::Base
        
        # NOTE: ARIALABELLEDBY has not been introduced on speed modals.
        # ex: aria-labelledby="exampleModalLabel"
        # which is then the ID of the modal title element

        def component_family
          p "====== Printed from: (Bootstrap::Components::Modal) self.class.name: #{self.class.name} method: #{__method__}"
          :modal
        end

        def title
          p "====== Printed from: (Bootstrap::Components::Modal) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:title, nil)
        end

        def footer
          p "====== Printed from: (Bootstrap::Components::Modal) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:footer, nil)
        end

        private

        def css_classes
          p "====== Printed from: (Bootstrap::Components::Modal) self.class.name: #{self.class.name} method: #{__method__}"
          super + ' fade'
        end

        def non_html_attribute_options
          p "====== Printed from: (Bootstrap::Components::Modal) self.class.name: #{self.class.name} method: #{__method__}"
          super.push((:footer if footer.present?), (:title if title.present?))
        end

        def assistive_html_attributes
          p "====== Printed from: (Bootstrap::Components::Modal) self.class.name: #{self.class.name} method: #{__method__}"
          super.merge(role: 'dialog', tabindex: '-1', aria: { hidden: 'true' })
        end
      end
    end
  end
end
