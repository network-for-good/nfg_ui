shared_examples_for 'a component that includes the Tooltipable utility module' do
  describe 'Tooltipable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Tooltipable }
    it 'responds to the dismissible public methods' do
      expect(component).to respond_to :tooltip, :html_options, :disabled_component_tooltip_wrapper_html_options
    end
  end
end
