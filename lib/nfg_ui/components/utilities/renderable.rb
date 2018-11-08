module NfgUi
  module Components
    module Utilities
      # Allows us to skip -if statements in our code and directly
      # setup a render_if / render_unless right on the component.
      module Renderable
        def render_if
          options.fetch(:render_if, nil)
        end

        def render_unless
          options.fetch(:render_unless, nil)
        end

        private

        def non_html_attribute_options
          super.push(:render_if,
                     :render_unless)
        end
      end
    end
  end
end
