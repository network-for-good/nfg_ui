include ComponentRespondsHelper

# Ensure that you are visiting the targeted page
# before running this shared example
#
# Ex: before { visit modal_feature_spec_views_path }
shared_examples_for 'a page that contains all of the enhanced components' do |tested_method: |
  describe 'modalable components are present on the page for testing modalability' do
    let(:component_css_classes) { components_that_respond_to_method(component_suite: :nfg, tested_method: tested_method, css_class: true) }
    it 'includes all of the modalable component elements on the page' do
      component_css_classes.each do |css_class|
        expect(page).to have_css ".#{css_class}", visible: :all
      end
    end
  end
end
