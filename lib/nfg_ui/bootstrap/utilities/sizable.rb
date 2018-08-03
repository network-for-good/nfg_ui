# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Applies ability to modify the component's size
      # Pass in :lg or :sm
      module Sizable
        # attr_accessor :size

        # def initialize(*)
        #   super
        #   self.size = options.fetch(:size, default_size)
        # end
        def size
          p "====== Printed from: (Bootstrap::Utilities::Sizable) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:size, nil)
        end

        private

        def resized?
          p "====== Printed from: (Bootstrap::Utilities::Sizable) self.class.name: #{self.class.name} method: #{__method__}"
          size == :sm || size == :lg
        end

        # def defaults
        #   super.merge(size: default_size)
        # end

        # def css_classes
        #   resized? ? super + size_css_class : super
        # end

        # def size_css_class
        #   " #{component_css_class}-#{component_size}" if resized?
        # end

        def non_html_attribute_options
          p "====== Printed from: (Bootstrap::Utilities::Sizable) self.class.name: #{self.class.name} method: #{__method__}"
          super.push(:size)
        end

        # def bootstrap4_size_options
        #   [:sm, :lg, *alias_size_options]
        # end

        # def alias_size_options
        #   %i[small lg]
        # end

        # def component_size
        #   case size
        #   when :lg then :lg
        #   when :sm then :sm
        #   when :large then :lg
        #   when :small then :sm
        #   end
        # end

        # def default_size
        #   nil
        # end
      end
    end
  end
end
