# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Table Component
      # https://getbootstrap.com/docs/4.1/content/tables/
      class Table < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Responsiveable
        include Bootstrap::Utilities::Sizable

        def size
          if options.fetch(:size, nil) == :lg
            raise ArgumentError.new I18n.t('nfg_ui.errors.argument_error.components.table.size')
          else
            super
          end
        end

        def render
          if responsive
            content_tag(:div, class: responsive_css_class) { super }
          else
            super
          end
        end

        def striped
          options.fetch(:striped, false)
        end

        def bordered
          options.fetch(:bordered, false)
        end

        private

        # Remove '.table-responsive' from the table element css classes
        # since a real "responsive table" is actually a <table>
        # wrapped in a div, example:
        #
        # <div class='table-responsive'>
        #   <table class='table'>
        #     ...
        #   </table>
        # </div>
        def css_classes
          [
            super,
            ("#{component_css_class}-striped" if striped),
            ("#{component_css_class}-bordered" if bordered)
          ].join(' ').squish&.remove!(responsive_css_class) # see above note
        end

        def base_element
          :table
        end

        def non_html_attribute_options
          super.push(:striped, :bordered)
        end
      end
    end
  end
end
