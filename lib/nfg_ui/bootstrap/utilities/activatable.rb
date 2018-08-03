# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Passes in necessary attributes to allow a component to have an active state
      module Activatable

        def active
          p "====== Printed from: (Bootstrap::Utilities::Activatable) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:active, default_active)
        end

        # def active?
        #   active
        # end

        # def defaults
        #   super.merge(active: default_active)
        # end

        private

        def css_classes
          p "====== Printed from: (Bootstrap::Utilities::Activatable) self.class.name: #{self.class.name} method: #{__method__}"
          active ? super + ' active' : super
        end

        def non_html_attribute_options
          p "====== Printed from: (Bootstrap::Utilities::Activatable) self.class.name: #{self.class.name} method: #{__method__}"
          super.push(:active)
        end

        def default_active
          p "====== Printed from: (Bootstrap::Utilities::Activatable) self.class.name: #{self.class.name} method: #{__method__}"
          false
        end
      end
    end
  end
end
