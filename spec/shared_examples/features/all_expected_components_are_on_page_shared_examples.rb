# Ensure that you are visiting the targeted page
# before running this shared example
#
# Ex: before { visit modal_feature_spec_views_path }
# 
# Optional `:let` examples:
# Let(:additional_component_css_classes) { "['h6[data-toggle='tooltip']" }

shared_examples_for 'a page that contains all of the utility enhanced components' do |tested_method:, component_suite: :nfg|
  describe 'modalable components are present on the page for testing modalability' do
    let(:component_css_classes) { components_that_have_defined_method(component_suite: component_suite, tested_method: tested_method, css_class: true) }
    it 'includes all of the modalable component elements on the page' do

      # if parent spec sets a let(:additional_component_css_classes), this will combine
      # the custom selectors with the detected component_css_classes. 
      # this is useful for situations like seeking 
      # this selector to test a component's presence on:
      # p[data-toggle='tooltip'][data-describe='tooltip-typeface-body']
      additional_component_css_classes ||= []
      component_and_custom_css_selectors = [component_css_classes, *additional_component_css_classes].flatten.reject(&:blank?)

      component_and_custom_css_selectors.each do |css_class|
        p "within spec: #{css_class}"
        expect(page).to have_css css_class, visible: :all
      end
    end
  end
end
