RSpec.describe 'Opening and closing a modal from various tooltippable components', type: :feature, js: true do
  let(:tooltip_text) { ComponentAttributeDefaultsHelper::feature_spec_tooltip_text }
  let(:typeface_component_css_selectors) { 
    ["h6[data-toggle='tooltip'][data-describe='tooltip-typeface-title']",
     "h5[data-toggle='tooltip'][data-describe='tooltip-typeface-heading']",
     "h6[data-toggle='tooltip'][data-describe='tooltip-typeface-subheading']",
     "p.font-size-sm[data-toggle='tooltip'][data-describe='tooltip-typeface-caption']",
     "p[data-toggle='tooltip'][data-describe='tooltip-typeface-body']"] }
  let(:tested_additional_component_css_classes) { ['.fa', "h6[data-toggle='tooltip']"] }
  before { visit tooltip_feature_spec_views_path }
  let(:additional_component_css_classes) { [*typeface_component_css_selectors, *tested_additional_component_css_classes] }

  # Do what we can to ensure we're not missing some 
  # new modalable components along the way.
  it_behaves_like 'a page that contains all of the utility enhanced components', tested_method: :tooltip, component_suite: :nfg

  
end
