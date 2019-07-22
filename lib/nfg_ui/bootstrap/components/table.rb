# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Table Component
      # https://getbootstrap.com/docs/4.1/content/tables/
      class Table < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Responsiveable


        def render
          if responsive
            content_tag(:div, class: responsive_css_class) { super }
          else
            super
          end
        end

        private

        # Remove table-responsive from the table element
        # since the responsive table is actually a <table>
        # wrapped in a <div class='table-responsive'>
        def css_classes
          responsive ? super.remove!('table-responsive') : super
        end

        def base_element
          :table
        end

      end
    end
  end
end
