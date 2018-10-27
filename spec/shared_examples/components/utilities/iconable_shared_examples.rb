shared_examples_for 'a component that includes the Iconable utility module' do
  describe 'Iconable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Iconable }
    it 'responds to the Iconable public methods' do
      expect(component).to respond_to :icon
    end
  end
end
