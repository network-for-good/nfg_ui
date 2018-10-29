shared_examples_for 'a component that includes the Dismiss trait module' do
  describe 'Dismiss trait module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Components::Traits::Dismiss }
    it "responds to the Dismiss traits' public methods" do
      expect(component).to respond_to(:dismissible_trait)
    end
  end
end
