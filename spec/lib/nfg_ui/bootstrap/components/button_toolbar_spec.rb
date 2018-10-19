require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::ButtonToolbar do
  let(:button_toolbar) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  
  describe '#component_css_class' do
    subject { button_toolbar.send(:component_css_class) }
    it { is_expected.to eq 'btn-toolbar' }
  end

  describe '#assistive_html_attributes' do
    subject { button_toolbar.send(:assistive_html_attributes) }
    it { is_expected.to eq(role: 'toolbar') }
  end
end
