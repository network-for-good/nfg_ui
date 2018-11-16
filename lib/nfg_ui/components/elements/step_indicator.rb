# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Step doc coming soon
      class StepIndicator < NfgUi::Components::Elements::NavLink
        def component_family
          :steps
        end

        def href
          options.fetch(:href, '#')
        end

        def step
          options.fetch(:step, nil)
        end

        private

        def non_html_attribute_options
          super.push(:step)
        end
      end
    end
  end
end
