# frozen_string_literal: true

shared_examples_for 'a component that includes the Themeable utility module' do
  describe 'Themeable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Themeable }
    it 'responds to the Themeable public methods' do
      expect(component).to respond_to :outlined, :theme
    end
  end
end
