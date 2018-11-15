shared_examples_for 'a component that includes the Titleable utility module' do
  describe 'Titleable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Titleable }
    it 'responds to the Titleable public methods' do
      expect(component).to respond_to :title
    end
  end
end
