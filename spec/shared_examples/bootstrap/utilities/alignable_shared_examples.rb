shared_examples_for 'a component that includes the Alignable utility module' do
  describe 'Alignable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Alignable }
    it 'responds to the wrappable public methods' do
      expect(component).to respond_to :right, :center
    end
  end
end
