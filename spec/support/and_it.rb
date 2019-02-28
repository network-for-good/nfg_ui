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
#   and_it 'outputs this result'
# end
def and_it(message)
  if block_given?
    yield
  else
    pending message
  end
end
alias and_context and_it

