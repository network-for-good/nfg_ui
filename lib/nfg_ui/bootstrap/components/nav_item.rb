# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Nav Component
      # https://getbootstrap.com/docs/4.1/components/navs/
      class NavItem < Bootstrap::Components::Base
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

        # For passing through to nav_link
        def disabled
          options.fetch(:disabled, false)
        end

        def dropdown
          options.fetch(:dropdown, false)
        end

        def href
          options.fetch(:href, nil)
        end

        def include_nav_link?
          (href.present? && options[:as].nil?) || dropdown
        end

        private

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

        # Regarding :href attribute -- Slight work around; since we're using :href to determine
        # whether or not to supply the nav_link component automatically
        # We will then need to exclude :href from the nav_item's html attributes
        # so that it doesn't show up in the li.nav-item as <li class='nav-item' href='...'>
        # and instead gets "passed through" to the a.nav-link
        def non_html_attribute_options
          super.push(:active,
                     :disabled,
                     :dropdown,
                     :button,
                     :href)
        end
      end
    end
  end
end
