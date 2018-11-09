# frozen_string_literal: true

def substring_present?(string:, starting_substring:, ending_substring:, sought_substring:)
  regex = /(?<=#{starting_substring})(.*?\n?)(?=#{ending_substring})/
  
  string[regex, 1].match(sought_substring)
end
