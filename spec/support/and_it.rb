def and_it(message)
  if block_given?
    yield
  else
    pending message
  end
end
alias and_context and_it

