shared_examples_for 'a component that includes the CollapseToggleable utility module' do
  describe 'CollapseToggleable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::CollapseToggleable }
    it 'responds to the CollapseToggleable public methods' do
      expect(component).to respond_to :data
    end
  end
end
