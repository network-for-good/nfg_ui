module ComponentAttributeDefaultsHelper
  def feature_spec_modal_id_string
    'test_modal'
  end

  def feature_spec_modal_target
    "##{feature_spec_modal_id_string}"
  end

  # Allows for setting up (and stubbing) conditional nil value option keys
  #
  # Example:
  # ui.nfg :button, modal: '#the_modal', tooltip: ('tooltip' if feature_spec_truthy_condition?)
  #
  # The above results in a modalable button that has a (valid) nil tooltip.
  def feature_spec_truthy_condition?
    false
  end

  def feature_spec_href
    '#included_href'
  end

  def feature_spec_tooltip_text
    'A valid tooltip'
  end
end
