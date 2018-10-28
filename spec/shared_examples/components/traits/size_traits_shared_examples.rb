shared_examples_for 'a component that includes the Size trait module' do
  describe 'Size trait module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Components::Traits::Size }
    it "responds to the Size traits' public methods" do
      expect(component).to respond_to(:lg_trait,
                                      :sm_trait)
    end
  end
end
