# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Nav Component
      # https://getbootstrap.com/docs/4.1/components/navs/
      class NavLink < Bootstrap::Components::Base
        include Bootstrap::Utilities::Activatable
        include Bootstrap::Utilities::Disableable

        def component_family
          :nav
        end

        def dropdown
          options.fetch(:dropdown, false)
        end

        def href
          options.fetch(:href, nil)
        end

        def tab
          options.fetch(:tab, nil)
        end

        def data
          tab ? super.merge!(toggle: 'tab') : super
        end

        private

        def non_html_attribute_options
          super.push(:tab, :dropdown)
        end

        def assistive_html_attributes
          return super unless tab
          { role: 'tab', aria: { controls: tab.tr('#', ''), selected: active } }
        end
      end
    end
  end
end
