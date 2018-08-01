shared_examples_for 'a component that includes the Dismissible utility module' do
  describe 'Dismissible module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Dismissible }
    it 'responds to the dismissible public methods' do
      expect(component).to respond_to :theme, :outlined
    end 
  end
end
