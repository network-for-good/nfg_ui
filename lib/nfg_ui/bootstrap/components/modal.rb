# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Modal Component
      # https://getbootstrap.com/docs/4.1/components/modal/
      class Modal < Bootstrap::Components::Base
        
        # include Bootstrap::Utilities::AriaAssistable

        # attr_reader :footer

        # def initialize(*)
        #   super
        #   @footer = options.fetch(:footer, '')
        #   build_aria(aria_key: :hidden, aria_value: 'true')
        #   build_aria(aria_key: :labelledby, aria_value: "#{id}_modal_title")
        # end

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
          super.merge(role: 'dialog', tabindex: '-1')
        end
      end
    end
  end
end
