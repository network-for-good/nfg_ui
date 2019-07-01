# Required `:let` examples:
# let(:tooltippable_component_selectors) { [["[data-describe='tooltip-icon']", etc] }
# let(:nested_toggle) { false }
shared_examples_for 'tooltippable components that activate a tooltip' do
  it 'activates tooltips on tooltippable component' do
    tooltippable_component_selectors.each do |selector|
      maybe_open_dropdown_menu(maybe_open_dropdown: dropdown, dropdown_data_describe: dropdown_data_describe, nested_toggle: nested_toggle)
      confirm_tooltip_presence(selector: selector)
    end
  end
end

RSpec.describe 'Activating a tooltip on all tooltippable components', type: :feature, js: true do
  let(:tooltip_text) { ComponentAttributeDefaultsHelper::feature_spec_tooltip_text }
  let(:typeface_component_css_selectors) {
    ["h6[data-toggle='tooltip'][data-describe='tooltip-typeface-title']",
     "h5[data-toggle='tooltip'][data-describe='tooltip-typeface-heading']",
     "h6[data-toggle='tooltip'][data-describe='tooltip-typeface-subheading']",
     "p.font-size-sm[data-toggle='tooltip'][data-describe='tooltip-typeface-caption']",
     "p[data-toggle='tooltip'][data-describe='tooltip-typeface-body']"] }
  let(:tested_additional_component_css_classes) { ['.fa', "h6[data-toggle='tooltip']"] }
  let(:additional_component_css_classes) { [*typeface_component_css_selectors, *tested_additional_component_css_classes] }

  before { visit tooltip_feature_spec_views_path }

  # Do what we can to ensure we're not missing some
  # new tooltippable components along the way.
  it_behaves_like 'a page that contains all of the utility enhanced components', tested_method: :tooltip, component_suite: :nfg

  describe 'activating the tooltip' do
    let(:describe) { nil }
    let(:element) { '' }
    let(:dropdown_data_describe) { '' }
    let(:nested_toggle) { false }
    let(:dropdown) { false }

    before { scroll_to_element("[data-describe=\'#{dropdown_data_describe}\']") if dropdown }

    describe 'activating tooltips on typeface components' do
      let(:tooltippable_component_selectors) { typeface_component_css_selectors }
      it_behaves_like 'tooltippable components that activate a tooltip'
    end

    describe 'tooltips on badges' do
      let(:tooltippable_component_selectors) { ["[data-describe='tooltip-badge']", "[data-describe='tooltip-badge-with-link']", "[data-describe='tooltip-badge-pill']", "[data-describe='tooltip-badge-pill-with-link']"] }
      it_behaves_like 'tooltippable components that activate a tooltip'
    end

    describe 'tooltips on icons' do
      let(:tooltippable_component_selectors) { ["[data-describe='tooltip-icon']", "[data-describe='tooltip-icon-with-text']"] }
      it_behaves_like 'tooltippable components that activate a tooltip'
    end

    describe 'tooltips on buttons' do
      let(:tooltippable_component_selectors) { ["[data-describe='tooltip-button']",
                                                "[data-describe='tooltip-button-link']",
                                                "[data-describe='tooltip-button-with-nil-modal']",
                                                "[data-describe='disabled-button-wrapper'] [data-toggle='tooltip']"] }
      it_behaves_like 'tooltippable components that activate a tooltip'
    end

    describe 'tooltips on dropdown items' do
      let(:dropdown) { true }
      let(:dropdown_data_describe) { 'dropdown-menu' }
      let(:tooltippable_component_selectors) { ["[data-describe='tooltip-dropdown-item']",
                                                "[data-describe='tooltip-dropdown-item-with-nil-modal']",
                                                "[data-describe='disabled-dropdown-item-wrapper'] [data-toggle='tooltip']"] }
      it_behaves_like 'tooltippable components that activate a tooltip'
    end

    describe 'tooltips on nav items' do
      let(:tooltippable_component_selectors) { ["[data-describe='tooltip-nav-item']",
                                                "[data-describe='tooltip-active-nav-item']",
                                                "[data-describe='tooltip-nav-item-with-nil-modal']"
                                                # "[data-describe='disabled-nav-item-wrapper'] [data-toggle='tooltip']"
                                              ] }
      it_behaves_like 'tooltippable components that activate a tooltip'

      pending "[data-describe='disabled-nav-item-wrapper'] [data-toggle='tooltip'] does not yet work"
    end

    describe 'tooltips on slact actions' do
      let(:tooltippable_component_selectors) { ["[data-describe='tooltip-slat-action']","[data-describe='tooltip-slat-action-with-href']","[data-describe='modal-slat-action-with-tooltip']","[data-describe='disabled-slat-action-wrapper'] [data-toggle='tooltip']" ] }

      it 'activates tooltips on tooltippable slat action items' do
        tooltippable_component_selectors.each do |selector|
          page.find("[data-describe='slat-actions-menu'] .dropdown-toggle").click
          sleep 0.25
          confirm_tooltip_presence(selector: selector)
          page.find("body").click
        end
      end
    end

    describe 'tooltips on steps' do
      let(:tooltippable_component_selectors) { [ "[data-describe='tooltip-step-visited']",
                                                 "[data-describe='tooltip-step-active']"
                                                 # "[data-toggle='disabled-tooltip-step-wrapper'] [data-toggle='tooltip']"
                                                ] }

      it_behaves_like 'tooltippable components that activate a tooltip'

      pending "[data-toggle='disabled-tooltip-step-wrapper'] [data-toggle='tooltip'] doesn't work yet."
    end

    describe 'tooltips on progress' do
      let(:tooltippable_component_selectors) { ["[data-describe='tooltip-progress']"] }

      it_behaves_like 'tooltippable components that activate a tooltip'
    end

    describe 'tooltips on images' do
      let(:tooltippable_component_selectors) { ["[data-describe='tooltip-image']"] }
      it_behaves_like 'tooltippable components that activate a tooltip'
    end

    describe 'tooltips on illustrations' do
      let(:tooltippable_component_selectors) { ["[data-describe='tooltip-illustration']"] }
      it_behaves_like 'tooltippable components that activate a tooltip'
    end
  end
end

private

def wait_for_tooltip
  sleep 0.5
end

def confirm_tooltip_presence(selector:)
  page.find(selector).hover
  wait_for_tooltip
  expect(page).to have_css tooltip_id(selector: selector)
end
