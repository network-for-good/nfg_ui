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
      # Does not yet account for disabled components that have mouse events removed
      # Like a disabled button (which is then wrapped in a %span.d-block)
      module Tooltipable
        attr_reader :tooltip
        attr_accessor :data

        def initialize(*)
          super
          data_toggle_error if data_toggle_error?

          @tooltip = options.fetch(:tooltip, '')
          self.data = data.merge!(tooltip_data_attributes) if tooltip.present?
        end

        def html_options
          tooltip.present? ? super.merge!(title: tooltip) : super
        end

        private

        def tooltip_data_attributes
          { toggle: 'tooltip', placement: tooltip_placement, html: tooltip_html }
        end

        def data_toggle_error?
          data.key?(:toggle) && data[:toggle] != 'tooltip'
        end

        def data_toggle_error
          raise ArgumentError.new "#{self.class.name} passed in a data-toggle html attribute that is competing with the Tooltip module supplying a tooltip to this class.\nCurrent data attributes are: #{data}\n\nYou can certainly add your own data-toggle to your component... but you'll need to remove the :tooltip first."
        end

        def defaults
          super.merge!(tooltip: '')
        end

        def non_html_attribute_options
          super.push(:tooltip)
        end

        def tooltip_placement
          :top
        end

        def tooltip_html
          true
        end
      end
    end
  end
end
