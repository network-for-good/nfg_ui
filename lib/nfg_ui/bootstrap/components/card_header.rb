# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Card Header
      # https://getbootstrap.com/docs/4.1/components/card/#header-and-footer
      class CardHeader < Bootstrap::Components::Base
        def component_family
          :card
        end

        def heading
          options.fetch(:heading, nil)
        end

        private

        def non_html_attribute_options
          super.push(:heading)
        end
      end
    end
  end
end
