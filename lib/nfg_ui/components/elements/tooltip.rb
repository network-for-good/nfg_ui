# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Tooltip doc coming soon
      module Tooltip
        attr_reader :tooltip

        def initialize(*)
          super
          @tooltip = options.fetch(:tooltip, '')
        end

        def defaults
          super.merge!(tooltip: '')
        end

        def non_html_attribute_options
          super.push(:tooltip)
        end
      end
    end
  end
end
