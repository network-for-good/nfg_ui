require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Alert do
  let(:alert) { FactoryBot.build(:bootstrap_alert, **options) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }

  describe '#assistive_html_attributes' do
    subject { alert.send(:assistive_html_attributes) }
    it { is_expected.to eq(role: 'alert') }
  end

  describe 'Dismissible module included in Alert' do
    it { expect(described_class).to include NfgUi::Bootstrap::Utilities::Dismissible }
    it 'responds to the dismissible public methods' do
      expect(alert).to respond_to :dismissible, :dismissible?
    end
  end

  describe 'Themeable module included in Alert' do
    it { expect(described_class).to include NfgUi::Bootstrap::Utilities::Themeable }
    it 'responds to the themeable public methods' do
      expect(alert).to respond_to :theme, :outlined
    end
  end
end
