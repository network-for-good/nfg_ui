# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Badge Component
      # https://getbootstrap.com/docs/4.1/components/badge/
      class Badge < Bootstrap::Components::Base
        include Bootstrap::Utilities::Themeable
        include Bootstrap::Utilities::Wrappable

        private

        def pill
          p "====== Printed from: (Bootstrap::Components::Badge) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:pill, default_pill)
        end

        def css_classes
          p "====== Printed from: (Bootstrap::Components::Badge) self.class.name: #{self.class.name} method: #{__method__}"
          pill ? super + " #{component_css_class}-pill" : super
        end

        def default_pill
          p "====== Printed from: (Bootstrap::Components::Badge) self.class.name: #{self.class.name} method: #{__method__}"
          false
        end

        def non_html_attribute_options
          p "====== Printed from: (Bootstrap::Components::Badge) self.class.name: #{self.class.name} method: #{__method__}"
          pill ? super.push(:pill) : super
        end

        # def default_html_wrapper_element
        #   :span
        # end
      end
    end
  end
end
