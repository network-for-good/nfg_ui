# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Step doc coming soon
      class StepIndicator < NfgUi::Components::Elements::NavLink
        include Bootstrap::Utilities::Wrappable

        def component_family
          :steps
        end

        def step
          options.fetch(:step, nil)
        end

        def render
          content_tag(as, html_options) do
            concat(content_tag(:div, class: 'step-indicator') {
              if icon
                NfgUi::Components::Foundations::Icon.new({ traits: [icon] }, view_context).render
              else
                step
              end
            })
            concat(NfgUi::Components::Foundations::Typeface.new({ traits: [:muted], caption: (block_given? ? yield : body), class: 'mt-1 mb-0 step-text' }, view_context).render) if (block_given? || body.present?)
          end
        end

        private

        # Become a :span if :href is not present in options.
        #
        # While span is the defined default_html_wrapper_element in Bootstrap::Utilities::Wrappable,
        # We set :span explicitly here because to ensure that regardless of what the default wrapper becomes, :span is preserved.
        def default_html_wrapper_element
          :span
        end

        def non_html_attribute_options
          super.push(:step)
        end
      end
    end
  end
end
