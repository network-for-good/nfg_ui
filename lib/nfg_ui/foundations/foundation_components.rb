# frozen_string_literal: true

module NfgUi
  module Foundations
    # The list of design system components within
    # the 'Foundation' grouping.
    #
    # This is the authoritative list of viable, usable 'Foundation' components
    module FoundationComponents
      def foundation_components
        %i[color
           icon
           image
           input
           grid
           typeface]
      end
    end
  end
end
