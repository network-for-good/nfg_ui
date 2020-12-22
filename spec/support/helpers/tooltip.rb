# frozen_string_literal: true

# Return the css selector string for a generated tooltip
# This collects the dynamically added aria-describedby value
# from the source component (e.g.: button) that, once hovered,
# fires the tooltip.
#
# The `aria-describedby` value of that source component
# is the css ID of the newly added tooltip element on the page.
#
# This then adds the '#' symbol in front of the value to return
# a valid CSS ID selector, ex: '#tooltip41235'
def tooltip_id(selector:)
  "##{page.find(selector)['aria-describedby']}"
end
