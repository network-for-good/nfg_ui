shared_examples_for 'a component that includes the Collapse trait module' do
  describe 'Collapse trait module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Components::Traits::Collapse }
    it "responds to the Collapse traits' public methods" do
      expect(component).to respond_to(:collapsible_trait,
                                      :collapsed_trait)
    end
  end
end
