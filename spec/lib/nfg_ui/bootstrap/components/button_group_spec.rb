require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::ButtonGroup do
  let(:button_group) { FactoryBot.build(:bootstrap_button_group) }

  subject { described_class }

  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }

  describe '#component_css_class' do
    subject { button_group.send(:component_css_class) }
    it { is_expected.to eq 'btn-group' }
  end

  describe '#assistive_html_attributes' do
    subject { button_group.send(:assistive_html_attributes) }
    it { is_expected.to eq(role: 'group') }
  end
end
