def by(message)
  if block_given?
    yield
  else
    pending message
  end
end
alias and_by by

