# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Dropdown Component
      # https://getbootstrap.com/docs/4.1/components/dropdowns/
      class DropdownToggle < Bootstrap::Components::Base
        # include Bootstrap::Utilities::Themeable
        include Bootstrap::Utilities::Wrappable
        # include Bootstrap::Utilities::Tooltipable
        # include Bootstrap::Utilities::Disableable

        # def as
        #   options.fetch(:as, :button)
        # end

        def component_family
          :dropdown
        end

        def offset
          options.fetch(:offset, '')
        end

        # Bypass & Skip Bootstrap::Utilities::Themeable module 
        # this method just passes the options[:theme] to the button component
        # Otherwise, if utilizing :button AND Themeable, 
        # we end up with duplicate theme css classes being sent to the button...
        # ex: <button class='btn-danger btn-danger'...>
        def theme
          options.fetch(:theme, NfgUi::DEFAULT_BOOTSTRAP_THEME)
        end

        def html_options
          as == :a ? super.merge!(href: '#') : super
        end

        def data
          data_toggle = { toggle: 'dropdown' }
          offset.present? ? { **data_toggle, offset: offset } : data_toggle
        end

        private

        def assistive_html_attributes
          { aria: { haspopup: "true", expanded: "false" } }
        end

        def default_html_wrapper_element
          :button
        end

        def non_html_attribute_options
          super.push(:offset)
        end

        # def theme_css_class_prefix
        #   'btn'
        # end
      end
    end
  end
end
