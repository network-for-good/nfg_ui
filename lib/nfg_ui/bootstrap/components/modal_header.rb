# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Modal Component
      # https://getbootstrap.com/docs/4.1/components/modal/
      class ModalHeader < NfgUi::Bootstrap::Components::Base

        def component_family
          :modal
        end

        def title
          options.fetch(:title, nil)
        end

        def render
          super do
            concat(content_tag(:h5, title, class: 'modal-title')) if title
            concat(NfgUi::Bootstrap::Components::Button.new({ as: :button, class: 'close', theme: nil, data: { dismiss: 'modal' }, aria: { label: 'Close' } }, view_context).render {
              content_tag(:span, "&times;".html_safe, { aria: { hidden: 'true' } })
            })
          end
        end

        private

        def non_html_attribute_options
          super.push(:title)
        end
      end
    end
  end
end
