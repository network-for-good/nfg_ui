# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Progress Component
      # https://getbootstrap.com/docs/4.1/components/progress/
      class TabPane < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Activatable

        def component_family
          :tab
        end

        def tab
          options.fetch(:tab, nil)
        end

        def id
          tab ? tab.tr('#', '') : super
        end

        # Fade is turned on by default
        # This should probably be a global setting
        def fade
          options.fetch(:fade, true)
        end

        private

        def css_classes
          [
            super,
            ('fade' if fade),
            ('show' if active)
          ].join(' ').squish
        end

        def non_html_attribute_options
          super.push(:tab)
        end

        def assistive_html_attributes
          { role: 'tabpanel' }
        end
      end
    end
  end
end
