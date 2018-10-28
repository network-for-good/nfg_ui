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
        include Bootstrap::Utilities::CollapseToggleable

        def block
          options.fetch(:block, false)
        end

        def data
          if modal
            super.merge!(toggle: 'modal', target: options[:modal])
          elsif !remote.nil?
            super.merge(remote: remote)
          else
            super
          end
        end

        def href
          return if options[:as] == :button
          if collapse
            collapse
          else
            options.fetch(:href, '#')
          end
        end

        def modal
          options.fetch(:modal, nil)
        end

        def remote
          options.fetch(:remote, nil)
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
          super.push(:modal, :block, :remove_component_css_classes, :remote)
        end
      end
    end
  end
end
