# frozen_string_literal: true

module NfgUi
  module Utilities
    # Yields an array of the components within the requested top
    # level design system grouping
    #
    # Example: grouped_components_array(grouping: :patterns)
    # Yields: [:activity_feed, :button_group, :card, etc...]
    module Groupings
      p ":::::: #{__FILE__.split('/').last.to_s} :::::: #{__FILE__} :::::: Loaded"
      def grouped_components_array(grouping:)
        "NfgUi::#{grouping.to_s.singularize.upcase}_COMPONENT_NAMES".constantize
      end
    end
  end
end
