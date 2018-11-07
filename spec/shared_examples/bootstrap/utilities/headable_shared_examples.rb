shared_examples_for 'a component that includes the Headable utility module' do
  describe 'Headable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Headable }
    it 'responds to the dismissible public methods' do
      expect(component).to respond_to :heading
    end
  end
end
