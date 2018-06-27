# frozen_string_literal: true

module NfgUi
  module Elements
    # The list of design system components within
    # the 'Element' grouping.
    #
    # This is the authoritative list of viable, usable 'Element' components
    module ElementComponents
      require_relative 'alert'

      def element_components
        %i[activity
           alert
           badge
           button
           chart
           dropdown
           form_group
           input_group
           key
           list_group_item
           loader
           media_object
           nav
           popover
           progress_bar
           slat
           table
           task
           tooltip]
      end
    end
  end
end
