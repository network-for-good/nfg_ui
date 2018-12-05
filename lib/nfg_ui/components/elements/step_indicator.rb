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

        def render
          content_tag(:a, html_options) do
            concat(content_tag(:div, class: 'step-indicator') {
              if icon
                NfgUi::Components::Foundations::Icon.new({ traits: [icon,] }, view_context).render
              else
                step
              end
            })
            concat(NfgUi::Components::Foundations::Typeface.new({ traits: [:muted], caption: (block_given? ? yield : body), class: 'mt-1 mb-0 step-text' }, view_context).render)
          end
        end

        private

        def non_html_attribute_options
          super.push(:step)
        end
      end
    end
  end
end
