# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Button Component
      # https://getbootstrap.com/docs/4.1/components/buttons/
      class Button < Bootstrap::Components::Base
        include Bootstrap::Utilities::Themeable
        include Bootstrap::Utilities::Sizable
        include Bootstrap::Utilities::Wrappable
        include Bootstrap::Utilities::Activatable
        include Bootstrap::Utilities::Disableable
        include Bootstrap::Utilities::Tooltipable
        include Bootstrap::Utilities::Collapsible

        # attr_reader :block, :modal

        # def initialize(*)
        #   super
        #   @modal = options.fetch(:modal, nil)
        #   @block = options.fetch(:block, default_block)
        #   data.merge!(toggle: 'modal', target: "##{modal}") if modal
        #   build_aria(aria_key: :pressed, aria_value: true) if active?
        # end

        # def block?
        #   block
        # end

        def block
          p "====== Printed from: (Bootstrap::Components::Button) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:block, false)
        end

        def modal
          p "====== Printed from: (Bootstrap::Components::Button) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:modal, nil)
        end

        # def html_options
        #   p "====== Printed from: (Bootstrap::Components::Button) self.class.name: #{self.class.name} method: #{__method__}"
        #   return super unless as == :a && (options[:collapse].present? || options[:modal].present?)
        #   if options[:collapse].present?
        #     super.merge!(href: collapse)
        #   elsif options[:modal].present?
        #     options[:href].nil? ? super.merge!(href: '#') : super
        #   end
        # end

        def href
          return if options[:as] == :button
          if collapse
            collapse
          elsif modal
            options[:href].nil? ? '#' : options[:href]
          else
            super
          end
        end

        def data
          p "====== Printed from: (Bootstrap::Components::Button) self.class.name: #{self.class.name} method: #{__method__}"
          # return super unless options[:modal].present?
          modal ? super.merge!(toggle: 'modal', target: options[:modal]) : super
        end

        def remove_component_css_classes
          options.fetch(:remove_component_css_classes, false)
        end

        private

        def collapse_data_attributes
          p "====== Printed from: (Bootstrap::Utilities::Collapsible) self.class.name: #{self.class.name} method: #{__method__}"
          as == :a ? super.except!(:target) : super
        end

        def component_css_class
          p "====== Printed from: (Bootstrap::Components::Button) self.class.name: #{self.class.name} method: #{__method__}"
          remove_component_css_classes ? '' : 'btn'
        end

        def css_classes
          p "====== Printed from: (Bootstrap::Components::Button) self.class.name: #{self.class.name} method: #{__method__}"
          block ? super + " #{component_css_class}-block" : super
        end

        def default_html_wrapper_element
          p "====== Printed from: (Bootstrap::Components::Button) self.class.name: #{self.class.name} method: #{__method__}"
          :a
        end

        def non_html_attribute_options
          p "====== Printed from: (Bootstrap::Components::Button) self.class.name: #{self.class.name} method: #{__method__}"
          super.push(:modal, :block, :remove_component_css_classes)
        end

        def assistive_html_attributes
          p "====== Printed from: (Bootstrap::Components::Button) self.class.name: #{self.class.name} method: #{__method__}"
          active ? super.merge(aria: { pressed: true }) : super
        end
      end
    end
  end
end
