# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Tooltip doc coming soon
      module Tooltip
        attr_reader :tooltip
        attr_accessor :data

        def initialize(*)
          super
          data_toggle_error if data_toggle_error?
          @tooltip = options.fetch(:tooltip, '')
          self.data = data.merge!(tooltip_data_attributes) if tooltip.present?

          update_html_options if tooltip.present?
        end

        def update_html_options
          html_options.merge!(title: tooltip)
        end

        private

        def tooltip_data_attributes
          { toggle: 'tooltip', placement: tooltip_placement, html: tooltip_html }
        end

        def data_toggle_error?
          data.key?(:toggle) && data[:toggle] != 'tooltip'
        end

        def data_toggle_error
          raise ArgumentError.new "#{self.class.name} passed in a data-toggle html attribute that is competing with the Tooltip module supplying a tooltip to this class.\nCurrent data attributes are: #{data}"
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
