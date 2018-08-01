require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::ButtonToolbar do
  let(:button_toolbar) { FactoryBot.create(:bootstrap_button_toolbar) }
  subject { described_class }
  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }

  describe '#component_css_class' do
    subject { button_toolbar.send(:component_css_class) }
    it { is_expected.to eq 'btn-toolbar' }
  end

  describe '#assistive_html_attributes' do
    subject { button_toolbar.send(:assistive_html_attributes) }
    it { is_expected.to eq(role: 'toolbar') }
  end
end
