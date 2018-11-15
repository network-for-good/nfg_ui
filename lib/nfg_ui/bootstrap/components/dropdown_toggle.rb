# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Dropdown Component
      # https://getbootstrap.com/docs/4.1/components/dropdowns/
      class DropdownToggle < Bootstrap::Components::Base
        include Bootstrap::Utilities::Wrappable
        include Bootstrap::Utilities::Sizable

        def component_family
          :dropdown
        end

        def data
          data_toggle = (options[:data] || {}).merge!(toggle: 'dropdown')
          offset.present? ? { **data_toggle, offset: offset } : data_toggle
        end

        def href
          as == :a ? '#' : super
        end

        def nav_link
          options.fetch(:nav_link, false)
        end

        def offset
          options.fetch(:offset, '')
        end

        def split
          options.fetch(:split, false)
        end

        # Bypass & Skip Bootstrap::Utilities::Themeable module
        # this method just passes the options[:theme] to the button component
        # Otherwise, if utilizing :button AND Themeable,
        # we end up with duplicate theme css classes being sent to the button...
        # ex: <button class='btn-danger btn-danger'...>
        def theme
          options.fetch(:theme, NfgUi::DEFAULT_BOOTSTRAP_THEME)
        end

        private

        def css_classes
          [
            super,
            ("#{component_css_class}-split" if split)
          ].join(' ').squish
        end

        def assistive_html_attributes
          { aria: { haspopup: 'true', expanded: 'false' } }
        end

        def default_html_wrapper_element
          :button
        end

        def non_html_attribute_options
          super.push(:offset, :nav_link)
        end

        # Toggle, in html, is a customized button, so sizing a toggle requires using the
        # button prefix -- otherwise it'll end up as
        # 'dropdown-toggle-lg' or 'dropdown-toggle-sm', etc
        def size_css_class_prefix
          'btn'
        end
      end
    end
  end
end
