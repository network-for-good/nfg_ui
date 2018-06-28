# frozen_string_literal: true

module NfgUi
  module Utilities
    # Yields an array of the components within the requested top
    # level design system grouping... and supporting the differentiation
    # of components within their diverse groupings.
    #
    # Example: grouped_components_array(grouping: :patterns)
    # Yields: [:activity_feed, :button_group, :card, etc...]
    module Groupings
      def grouped_components_array(grouping:)
        "NfgUi::#{grouping.to_s.singularize.upcase}_COMPONENT_NAMES".constantize
      end
    end
  end
end
