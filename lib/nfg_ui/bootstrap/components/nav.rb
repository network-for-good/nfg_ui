# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Nav Component
      # https://getbootstrap.com/docs/4.1/components/navs/
      class Nav < Bootstrap::Components::Base
        include Bootstrap::Utilities::Wrappable

        def component_family
          :nav
        end

        def fill
          options.fetch(:fill, false)
        end

        def justified
          options.fetch(:justified, false)
        end

        def tabs
          options.fetch(:tabs, false)
        end

        def pills
          options.fetch(:pills, false)
        end

        def right
          options.fetch(:right, false)
        end

        def center
          options.fetch(:center, false)
        end

        def vertical
          options.fetch(:vertical, false)
        end

        private

        def css_classes
          [
            super,
            ('justify-content-center' if center),
            ('justify-content-end' if right),
            ('flex-column' if vertical),
            ('nav-tabs' if tabs),
            ('nav-pills' if pills),
            ('nav-fill' if fill),
            ('nav-justified' if justified)
          ].join(' ').squish
        end

        def default_html_wrapper_element
          :ul
        end
      end
    end
  end
end
