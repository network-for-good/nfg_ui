# frozen_string_literal: true

# Use javascript to scroll down to an element
# This is typically used when / if Capybara has a difficult time
# clicking on an element (which will report back that clicking the target
# would result in a different element being clicked)
def scroll_to_element(element)
  page.find(element) rescue nil
  page.execute_script("$('html, body').scrollTop($(\"#{element}\").offset().top - 100);")
end
