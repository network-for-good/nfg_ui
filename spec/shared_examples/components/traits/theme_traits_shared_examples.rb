shared_examples_for 'a component that includes the Theme trait module' do
  describe 'Theme trait module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Components::Traits::Theme }
    it "responds to the Theme traits' public methods" do
      expect(component).to respond_to(:primary_trait,
                                      :secondary_trait,
                                      :success_trait,
                                      :danger_trait,
                                      :warning_trait,
                                      :info_trait,
                                      :light_trait,
                                      :dark_trait)
    end
  end
end
