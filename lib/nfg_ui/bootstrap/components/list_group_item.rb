# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap List Group Item Component
      # https://getbootstrap.com/docs/4.1/components/list-group/
      class ListGroupItem < Bootstrap::Components::Base
        include Bootstrap::Utilities::Wrappable
        include Bootstrap::Utilities::Activatable
        include Bootstrap::Utilities::Disableable
        include Bootstrap::Utilities::Themeable
        # private
        
        def component_family
          :list_group
        end

        def action
          options.fetch(:action, false)
        end

        def badge
          options.fetch(:badge, nil)
        end

        private

        def default_theme
          nil
        end

        def default_html_wrapper_element
          :li
        end

        def css_classes
          return super unless action || badge
          super +
            (action ? " #{component_css_class}-action" : '') +
            (badge ? ' d-flex justify-content-between align-items-center' : '')
        end

        def non_html_attribute_options
          super.push(:action, :badge)
        end
      end
    end
  end
end
