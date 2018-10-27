# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Navbar Component
      # https://getbootstrap.com/docs/4.1/components/navbar/
      class NavbarToggler < Bootstrap::Components::Base
        include Bootstrap::Utilities::CollapseToggleable

        # Pass through to collapse component
        # def collapse
        #   options.fetch(:collapse, nil)
        # end

        def component_family
          :navbar
        end

        # private

        # def assistive_html_attributes
        #   # raise super.inspect
        #   tester = collapse ? super.merge!(aria: { controls: collapse.tr('#', '') }) : super
        #   # collapse ? super.merge!(aria: { controls: collapse.tr('#', '') }) : super
        #   raise tester.inspect
        # end
      end
    end
  end
end
