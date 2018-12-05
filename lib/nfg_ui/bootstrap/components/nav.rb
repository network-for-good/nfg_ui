# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Nav Component
      # https://getbootstrap.com/docs/4.1/components/navs/
      class Nav < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Alignable
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

        def pill
          options.fetch(:pill, false)
        end

        def tabs
          options.fetch(:tabs, false)
        end

        def vertical
          options.fetch(:vertical, false)
        end

        def render
          content_tag(as, html_options) do
            (block_given? ? yield : body)
          end
        end

        private

        def component_css_class
          'nav'
        end

        def css_classes
          [
            super,
            ('nav-fill' if fill),
            ('nav-justified' if justified),
            ('nav-pills' if pill),
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
                     :pill,
                     :vertical)
        end
      end
    end
  end
end
