# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Nav Component
      # https://getbootstrap.com/docs/4.1/components/navs/
      class NavLink < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Activatable
        include Bootstrap::Utilities::Disableable
        include Bootstrap::Utilities::Remotable

        def component_family
          :nav
        end

        def dropdown
          options.fetch(:dropdown, false)
        end

        def tab
          options.fetch(:tab, nil)
        end

        def data
          tab ? super.merge!(toggle: 'tab') : super
        end

        def render
          if dropdown
            NfgUi::Bootstrap::Components::DropdownToggle.new({ body: (block_given? ? yield : body), as: :a, **html_options, theme: nil, nav_link: true }, view_context).render
          else
            super
          end
        end

        private

        def base_element
          :a
        end

        def component_css_class
          'nav-link'
        end

        def non_html_attribute_options
          super.push(:tab, :dropdown)
        end

        def assistive_html_attributes
          return super unless tab
          { aria: { controls: tab.tr('#', ''), selected: active } }
        end
      end
    end
  end
end
