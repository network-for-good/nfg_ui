# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Tooltip doc coming soon
      #
      # Bootstrap documentation
      # https://getbootstrap.com/docs/4.1/components/tooltips/
      #
      # Allows tooltips to be placed on any component's main wrapping element
      #
      # When tooltip is applied to a disabled component (via the tooltip argument)
      # the component will return the necessary information to build a wrapper div
      # due to the non-interactable nature of the disabled elements.
      #
      # Example implementation of a button in HAML:
      #
      # - if button.disabled_tooltipable?
      #   %span{ button.disabled_component_tooltip_wrapper_html_options }
      #     = content_tag button.html_wrapper_element, button.html_options do
      #       = button.body

      # - else
      #   = content_tag button.html_wrapper_element, button.html_options do
      #     = button.body
      #
      # Tooltip placement:
      # You can override the placement if needed by setting the tooltip_placement method
      # in your target class -- :top, :bottom, :left, :right
      #
      # Example:
      #
      # def tooltip_placement
      #   :right
      # end
      module Tooltipable
        include Bootstrap::Utilities::Disableable
        attr_reader :tooltip
        attr_accessor :data

        def initialize(*)
          super
          data_toggle_error if data_toggle_error?

          @tooltip = options.fetch(:tooltip, '')
          self.data = data.merge!(tooltip_data_attributes) if tooltipable?
        end

        def html_options
          return super unless tooltip.present?

          styles = options.fetch(:style, '') + (disabled? ? ' pointer-events: none;' : '')
          super.merge!(title: tooltip, style: styles)
        end

        def tooltipable?
          tooltip.present? && !disabled?
        end

        def disabled_tooltipable?
          tooltip.present? && disabled?
        end

        def tooltip?
          tooltip.present?
        end

        def disabled_component_tooltip_wrapper_html_options
          { data: tooltip_data_attributes,
            title: tooltip,
            class: 'd-inline-block',
            tabindex: 0 }
        end

        private

        def tooltip_data_attributes
          { toggle: 'tooltip',
            placement: tooltip_placement,
            html: tooltip_html.to_s }
        end

        def data_toggle_error?
          data.key?(:toggle) && data[:toggle] != 'tooltip'
        end

        def defaults
          super.merge!(tooltip: '')
        end

        def non_html_attribute_options
          super.push(:tooltip)
        end

        def tooltip_placement
          @tooltip_placement ||= :top
        end

        def tooltip_html
          true
        end

        def data_toggle_error
          raise ArgumentError.new "#{self.class.name} passed in a data-toggle html attribute that is competing with the Tooltip module supplying a tooltip to this class.\nCurrent data attributes are: #{data}\n\nYou can certainly add your own data-toggle to your component... but you'll need to remove the :tooltip first."
        end
      end
    end
  end
end
