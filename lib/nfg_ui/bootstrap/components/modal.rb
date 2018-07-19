# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Modal Component
      # https://getbootstrap.com/docs/4.1/components/modal/
      class Modal < Bootstrap::Components::Base
        require 'nfg_ui/components/utilities/titleable'
        require_relative '../utilities/aria_assistable'

        include NfgUi::Components::Utilities::Titleable
        include Bootstrap::Utilities::AriaAssistable

        attr_reader :footer

        def initialize(*)
          super
          @footer = options.fetch(:footer, '')
          build_aria(aria_key: :hidden, aria_value: 'true')
          build_aria(aria_key: :labelledby, aria_value: "#{id}_modal_title")
        end

        def html_options
          super.merge!(tabindex: '-1')
        end

        def footer?
          footer.present?
        end

        private

        def css_classes
          super + ' fade'
        end

        def non_html_attribute_options
          super.push((:footer if footer.present?))
        end

        def assistive_html_attributes
          super.merge(role: 'dialog')
        end
      end
    end
  end
end
