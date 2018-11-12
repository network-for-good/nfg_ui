# frozen_string_literal: true

def substring_present?(string:, starting_substring:, ending_substring:, sought_substring:)
  regex = /(?<=#{starting_substring})(.*?\n?)(?=#{ending_substring})/

  if sought_substring.is_a?(Array)
    sought_substring.all? { |substring| string[regex, 1].match(substring) }
  else
    string[regex, 1].match(sought_substring)
  end
end
