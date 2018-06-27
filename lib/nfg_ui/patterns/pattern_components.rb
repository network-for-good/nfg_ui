# frozen_string_literal: true

module NfgUi
  module Patterns
    # The list of design system components within
    # the 'Pattern' grouping.
    #
    # This is the authoritative list of viable, usable 'Pattern' components
    module PatternComponents
      def pattern_components
        %i[activity_feed
           button_group
           card
           carousel
           empty_state
           filter_bar
           form
           graph
           jumbotron
           list_group
           media_group
           modal
           navbar
           panel
           slat_list
           task_list
           tile]
      end
    end
  end
end
