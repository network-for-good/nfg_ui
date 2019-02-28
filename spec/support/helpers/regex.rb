# frozen_string_literal: true

# Scan between two points in a string to determine if something is present
# Particularly useful when scanning for a sub string in a very particular area
# e.g.: between the opening quotes and close quotes of the html `class` attribute
#
# Example usage:
# it 'does not render the component with the _active_ css class' do
#   expect(substring_present?(string: subject,
#                             starting_substring: "class='",
#                             ending_substring: "'",
#                             sought_substring: 'active')).not_to be
# end
def substring_present?(string:, starting_substring:, ending_substring:, sought_substring:)
  regex = /(?<=#{starting_substring})(.*?\n?)(?=#{ending_substring})/

  if sought_substring.is_a?(Array)
    sought_substring.all? { |substring| string[regex, 1].match(substring) }
  else
    string[regex, 1].match(sought_substring)
  end
end
