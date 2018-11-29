# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Nav Component
      # https://getbootstrap.com/docs/4.1/components/navs/
      class NavItem < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Wrappable

        # For passing through to nav_link
        # bypass module since active / disabled is applied
        # on the nav_link
        def active
          options.fetch(:active, false)
        end

        def button
          options.fetch(:button, nil)
        end

        def component_family
          :nav
        end

        def remote
          options.fetch(:remote, nil)
        end

        # For passing through to nav_link
        def disabled
          options.fetch(:disabled, false)
        end

        def dropdown
          options.fetch(:dropdown, false)
        end

        def include_nav_link?
          href.present? || dropdown || tab
        end

        def tab
          options.fetch(:tab, nil)
        end

        # href gets passed to the nav_link when present.
        # Removes :href from nav_item's html_options so we don't end up with
        # <li class='nav-item' href='#href'><a class='nav-link' href='#href'...
        def html_options
          super.except!(:href)
        end

        private

        def component_css_class
          'nav-item'
        end

        def automatic_as
          include_nav_link? ? :li : super
        end

        def css_classes
          [
            super,
            ('dropdown' if dropdown)
          ].join(' ').squish
        end

        def default_html_wrapper_element
          :li
        end

        def non_html_attribute_options
          super.push(:active,
                     :disabled,
                     :dropdown,
                     :button,
                     :tab,
                     :remote)
        end
      end
    end
  end
end
