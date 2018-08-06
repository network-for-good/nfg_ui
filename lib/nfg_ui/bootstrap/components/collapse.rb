module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Collapse Component
      # https://getbootstrap.com/docs/4.1/components/collapse/
      class Collapse < Bootstrap::Components::Base
        include Bootstrap::Utilities::Collapsible

        # def initialize(*)
        #   super
        #   @body = collapsible_wrapper_html
        # end

        # private

        # def component_css_class
        #   nil
        # end

        # def default_collapsed
        #   true
        # end
      end
    end
  end
end
