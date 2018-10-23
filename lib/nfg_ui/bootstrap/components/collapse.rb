module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Collapse Component
      # https://getbootstrap.com/docs/4.1/components/collapse/
      class Collapse < Bootstrap::Components::Base
        # include Bootstrap::Utilities::Collapsible

        # def initialize(*)
        #   super
        #   @body = collapsible_wrapper_html
        # end

        # def id
        #   p "====== Printed from: (Bootstrap::Components::Collapse) self.class.name: #{self.class.name} method: #{__method__}"
        #   if options[:id].present?
        #     options[:id]
        #   else
        #     raise ArgumentError.new "#{self.class.name} requires options[:id]. You must pass in an :id to the options hash\n\nExample:\n= ui.bootstrap :collapse, id: 'required_id', body: 'Your body'"
        #   end
        # end
        
        #   super
        #   # if options[:id].present?
        #   #   super
        #   # else
        #   #   raise ArgumentError.new("#{self.class.name} is missing options[:id]\n :id must be included in the component's options hash is required.")
        #   # end
        # end

        def navbar
          options.fetch(:navbar, false)
        end

        def collapsed
          p "====== Printed from: (Bootstrap::Components::Collapse) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:collapsed, default_collapsed)
        end

        private
        
        def css_classes
          p "====== Printed from: (Bootstrap::Components::Collapse) self.class.name: #{self.class.name} method: #{__method__}"
          [
            super,
            ('show' unless collapsed),
            ('navbar-collapse' if navbar)
          ].join(' ').squish
          # collapsed ? super : super + ' show'
        end
        
        # def component_css_class
        #   nil
        # end

        def non_html_attribute_options
          p "====== Printed from: (Bootstrap::Components::Collapse) self.class.name: #{self.class.name} method: #{__method__}"
          super.push(:collapsed, :navbar)
        end

        def default_collapsed
          p "====== Printed from: (Bootstrap::Components::Collapse) self.class.name: #{self.class.name} method: #{__method__}"
          true
        end
      end
    end
  end
end
