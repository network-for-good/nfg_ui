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

        private

        def non_html_attribute_options
          super.push(:title)
        end
      end
    end
  end
end
