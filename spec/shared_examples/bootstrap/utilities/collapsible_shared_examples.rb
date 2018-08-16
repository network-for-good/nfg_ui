shared_examples_for 'a component that includes the Collapsible utility module' do
  describe 'Collapsible module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Collapsible }
    it 'responds to the Collapsible public methods' do
      expect(component).to respond_to :collapse
    end
  end
end
