# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Step doc coming soon
      class Step < NfgUi::Components::Elements::NavItem
        include Bootstrap::Utilities::Activatable

        include NfgUi::Components::Utilities::Iconable

        include NfgUi::Components::Traits::Active
        include NfgUi::Components::Traits::Step

        # Override #active from Activatable
        def active
          # Active is a transitory state for steps
          # So when a step is active, it is automatically visited.
          # This sets visited to true.
          # This is also accounted for in the #active_trait for steps.
          options[:visited] = true if options[:active]
          super
        end

        def component_family
          :steps
        end

        # NOTE: DISABLED TOOLTIPS DO NOT YET WORK ON STEPS
        # NAVITEM DOES NOT INCLUDE DISABLEABLE MODULE
        # JR: 06-21-2019
        def disabled
          options[:disabled] || (!visited && !active)
        end

        def render
          content_tag(as, html_options) do
            NfgUi::Components::Elements::StepIndicator.new({ step: step.to_s, body: (block_given? ? yield : body), icon: icon, href: href, disabled: disabled }, view_context).render
          end
        end

        def step
          options.fetch(:step, nil)
        end

        def visited
          options.fetch(:visited, false)
        end

        private

        def base_element
          as
        end

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
