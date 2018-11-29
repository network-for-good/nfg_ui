# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Button Component
      # https://getbootstrap.com/docs/4.1/components/buttons/
      class Button < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Activatable
        include Bootstrap::Utilities::CollapseToggleable
        include Bootstrap::Utilities::Disableable
        include Bootstrap::Utilities::Remotable
        include Bootstrap::Utilities::Sizable
        include Bootstrap::Utilities::Themeable
        include Bootstrap::Utilities::Tooltipable
        include Bootstrap::Utilities::Wrappable

        def block
          options.fetch(:block, false)
        end

        def data
          modal ? super.merge!(toggle: 'modal', target: options[:modal]) : super
        end

        def href
          return if as != :a
          collapse ? collapse : (options[:href] || '#')
        end

        def modal
          options.fetch(:modal, nil)
        end

        def remove_component_css_classes
          options.fetch(:remove_component_css_classes, false)
        end

        private

        def assistive_html_attributes
          active ? super.merge(aria: { pressed: true }) : super
        end

        def css_classes
          block ? super + " #{component_css_class}-block" : super
        end

        def collapse_data_attributes
          as == :a ? super.except!(:target) : super
        end

        def component_css_class
          remove_component_css_classes ? '' : 'btn'
        end

        def default_html_wrapper_element
          :a
        end

        def non_html_attribute_options
          super.push(:modal, :block, :remove_component_css_classes)
        end
      end
    end
  end
end
