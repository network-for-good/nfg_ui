# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Button Component
      # https://getbootstrap.com/docs/4.1/components/buttons/
      class Button < Bootstrap::Components::Base
        # include Bootstrap::Utilities::Themeable
        # include Bootstrap::Utilities::Sizable
        # include Bootstrap::Utilities::Wrappable
        # include Bootstrap::Utilities::Activatable
        # include Bootstrap::Utilities::Disableable
        # include Bootstrap::Utilities::AriaAssistable
        # include Bootstrap::Utilities::Tooltipable

        # attr_reader :block, :modal

        # def initialize(*)
        #   super
        #   @modal = options.fetch(:modal, nil)
        #   @block = options.fetch(:block, default_block)
        #   data.merge!(toggle: 'modal', target: "##{modal}") if modal
        #   build_aria(aria_key: :pressed, aria_value: true) if active?
        # end

        # def block?
        #   block
        # end

        # private

        # def component_css_class
        #   'btn'
        # end

        # def css_classes
        #   block? ? super + " #{component_css_class}-block" : super
        # end

        # def default_block
        #   false
        # end

        # def default_html_wrapper_element
        #   :a
        # end

        # def non_html_attribute_options
        #   super.push((:modal if modal.present?))
        # end
      end
    end
  end
end
