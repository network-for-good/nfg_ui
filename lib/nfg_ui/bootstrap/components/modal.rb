# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Modal Component
      # https://getbootstrap.com/docs/4.1/components/modal/
      class Modal < NfgUi::Bootstrap::Components::Base

        # NOTE: ARIALABELLEDBY has not been introduced on speed modals.
        # ex: aria-labelledby="exampleModalLabel"
        # which is then the ID of the modal title element

        def component_family
          :modal
        end

        def title
          options.fetch(:title, nil)
        end

        def footer
          options.fetch(:footer, nil)
        end

        private

        def css_classes
          super + ' fade'
        end

        def non_html_attribute_options
          super.push((:footer if footer.present?), (:title if title.present?))
        end

        def assistive_html_attributes
          super.merge(role: 'dialog', tabindex: '-1', aria: { hidden: 'true' })
        end
      end
    end
  end
end
