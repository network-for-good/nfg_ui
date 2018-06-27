# frozen_string_literal: true

module NfgUi
  module Utilities
    # Yields an array of the components within the requested top
    # level design system grouping
    #
    # Example: grouped_components_array(grouping: :patterns)
    # Yields: [:activity_feed, :button_group, :card, etc...]
    module ComponentGroupings
      def grouped_components_array(grouping:)
        send("#{grouping.to_s.singularize}_components")
      end
    end
  end
end
