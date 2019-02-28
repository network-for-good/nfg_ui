# frozen_string_literal: true

# Supply a gramatic solution that breaks up specs
# with assertions that are, essentially, better than
# comments.
#
# This is contained within the `it` block
# Example:
# it 'does something' do
#   by 'doing one thing'
#   and_by 'doing another thing'
# end

def by(message)
  if block_given?
    yield
  else
    pending message
  end
end
alias and_by by

