module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Collapse Component
      # https://getbootstrap.com/docs/4.1/components/collapse/
      class Collapse < Bootstrap::Components::Base
        include Bootstrap::Utilities::Collapsible
        # def collapsed
        #   options.fetch(:collapsed, false)
        # end

        def navbar
          options.fetch(:navbar, false)
        end

        private

        def css_classes
          [
            super,
            ('show' unless collapsed),
            ('navbar-collapse' if navbar)
          ].join(' ').squish
        end

        def non_html_attribute_options
          super.push(:collapsed, :navbar)
        end
      end
    end
  end
end
