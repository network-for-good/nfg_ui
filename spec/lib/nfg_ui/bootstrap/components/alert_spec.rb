require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Alert do
  let(:alert) { FactoryBot.build(:bootstrap_alert, **options) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it { expect(described_class).to include NfgUi::Bootstrap::Utilities::Themeable }

  describe '#assistive_html_attributes' do
    subject { alert.send(:assistive_html_attributes) }
    it { is_expected.to eq(role: 'alert') }
  end
end
