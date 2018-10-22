# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Nav Component
      # https://getbootstrap.com/docs/4.1/components/navs/
      class Nav < Bootstrap::Components::Base
        include Bootstrap::Utilities::Wrappable

        def center
          options.fetch(:center, false)
        end

        def component_family
          :nav
        end

        def fill
          options.fetch(:fill, false)
        end

        def justified
          options.fetch(:justified, false)
        end

        def pills
          options.fetch(:pills, false)
        end

        def right
          options.fetch(:right, false)
        end

        def tabs
          options.fetch(:tabs, false)
        end

        def vertical
          options.fetch(:vertical, false)
        end

        private

        def css_classes
          [
            super,
            ('justify-content-center' if center),
            ('nav-fill' if fill),
            ('nav-justified' if justified),
            ('nav-pills' if pills),
            ('justify-content-end' if right),
            ('nav-tabs' if tabs),
            ('flex-column' if vertical)
          ].join(' ').squish
        end

        def default_html_wrapper_element
          :ul
        end

        def non_html_attribute_options
          super.push(:fill,
                     :justified,
                     :tabs,
                     :pills,
                     :right,
                     :center,
                     :vertical)
        end
      end
    end
  end
end
