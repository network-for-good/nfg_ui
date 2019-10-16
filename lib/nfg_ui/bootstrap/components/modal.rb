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

        def render
          super do
            content_tag(:div, class: modal_dialog_css_classes, role: 'document') do
              content_tag(:div, class: 'modal-content') do
                capture do
                  concat(NfgUi::Bootstrap::Components::ModalHeader.new({ title: title }, view_context).render)
                  if render_in_body
                    concat(NfgUi::Bootstrap::Components::ModalBody.new({ body: (block_given? ? yield : body) }, view_context).render)
                  else
                    concat(block_given? ? yield : body)
                  end
                  if footer
                    concat(NfgUi::Bootstrap::Components::ModalFooter.new({ body: footer }, view_context).render)
                  end
                end
              end
            end
          end
        end

        def render_in_body
          options.fetch(:render_in_body, true)
        end

        def size
          options.fetch(:size, nil)
        end

        private

        # Manually set css classes here so that sizable doesn't take over
        # and add size classes to the component html_options
        def css_classes
          [
            component_css_class,
            'fade'
          ].join(' ').squish
        end

        def modal_dialog_css_classes
          [
            'modal-dialog',
            (size_css_class if resized?)
          ].join(' ').squish
        end

        def non_html_attribute_options
          super.push((:footer if footer.present?), (:title if title.present?), :size)
        end

        def resized?
          [:sm, :lg, :xl].include?(size)
        end

        def size_css_class
          "#{component_css_class}-#{size}"
        end

        def assistive_html_attributes
          super.merge(role: 'dialog', tabindex: '-1', aria: { hidden: 'true' })
        end
      end
    end
  end
end
