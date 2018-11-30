# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Step doc coming soon
      class Step < NfgUi::Components::Elements::NavItem
        include Bootstrap::Utilities::Activatable

        include NfgUi::Components::Utilities::Iconable
        
        include NfgUi::Components::Traits::Step

        def component_family
          :steps
        end

        def step
          options.fetch(:step, nil)
        end

        def visited
          options.fetch(:visited, false)
        end

        def disabled
          options[:disabled] || (!visited && !active)
        end

        private

        def css_classes
          [
            super,
            ('visited' if visited)
          ].join(' ').squish
        end

        def non_html_attribute_options
          super.push(:visited, :step)
        end
      end
    end
  end
end