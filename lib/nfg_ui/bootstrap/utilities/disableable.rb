# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows components to have a disabled state when appropriate
      module Disableable

        def disabled
          p "====== Printed from: (Bootstrap::Utilities::Disableable) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:disabled, false)
        end

        private

        def css_classes
          p "====== Printed from: (Bootstrap::Utilities::Disableable) self.class.name: #{self.class.name} method: #{__method__}"
          return super if options[:as] == :button
          disabled ? super + ' disabled' : super
        end

        def non_html_attribute_options
          p "====== Printed from: (Bootstrap::Utilities::Disableable) self.class.name: #{self.class.name} method: #{__method__}"
          options[:as] == :button ? super : super.push(:disabled)
        end

        def assistive_html_attributes
          p "====== Printed from: (Bootstrap::Utilities::Disableable) self.class.name: #{self.class.name} method: #{__method__}"
          disabled ? super.merge!(tabindex: '-1') : super
        end
      end
    end
  end
end
