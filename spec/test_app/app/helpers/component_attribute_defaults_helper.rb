module ComponentAttributeDefaultsHelper
  def modal_id
    'test_modal'
  end

  def modal_target
    "##{modal_id}"
  end

  def is_true?
    false
  end

  def href
    '#included_href'
  end
end
