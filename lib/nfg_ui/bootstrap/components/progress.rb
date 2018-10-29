# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Parent Progress Component
      # https://getbootstrap.com/docs/4.1/components/progress/
      class Progress < Bootstrap::Components::Base
        include Bootstrap::Utilities::Progressable

        def component_family
          :progress
        end

        def height
          options.fetch(:height, nil)
        end

        def style
          [
            super,
            ("height: #{height}px;" if height)
          ].join(' ').squish
        end

        private

        def non_html_attribute_options
          super.push(:height)
        end
      end
    end
  end
end
