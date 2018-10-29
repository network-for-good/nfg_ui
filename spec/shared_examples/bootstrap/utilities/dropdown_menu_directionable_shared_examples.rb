shared_examples_for 'a component that includes the DropdownDirectionable utility module' do
  describe 'DropdownDirectionable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::DropdownDirectionable }
    it 'responds to the dropdown directionable public methods' do
      expect(component).to respond_to :dropleft, :dropright, :dropup
    end
  end
end
