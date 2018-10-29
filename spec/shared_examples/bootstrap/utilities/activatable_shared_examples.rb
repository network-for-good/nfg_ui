shared_examples_for 'a component that includes the Activatable utility module' do
  describe 'Activatable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Activatable }
    it 'responds to the dismissible public methods' do
      expect(component).to respond_to :active
    end
  end
end
