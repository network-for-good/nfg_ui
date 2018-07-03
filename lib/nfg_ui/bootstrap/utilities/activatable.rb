# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Passes in necessary attributes to allow a component to have an active state
      module Activatable
        attr_accessor :active

        def initialize(component_options)
          super
          self.active = component_options.fetch(:active, default_active)
        end

        def active?
          active
        end

        def defaults
          super.merge(active: default_active)
        end

        def html_classes
          [super, (active_css_class if active?)].join(' ')
        end

        def non_html_attribute_options
          super.push(:active)
        end

        private

        def active_css_class
          'active'
        end

        def default_active
          false
        end
      end
    end
  end
end
