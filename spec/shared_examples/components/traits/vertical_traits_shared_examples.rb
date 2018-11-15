shared_examples_for 'a component that includes the Vertical trait module' do
  describe 'Vertical trait module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Components::Traits::Vertical }
    it "responds to the Vertical traits' public methods" do
      expect(component).to respond_to(:vertical_trait)
    end
  end
end
