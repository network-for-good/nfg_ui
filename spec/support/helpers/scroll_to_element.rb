def scroll_to_element(element)
  page.find(element) rescue nil
  page.execute_script("$('html, body').scrollTop($(\"#{element}\").offset().top - 100);")
end
