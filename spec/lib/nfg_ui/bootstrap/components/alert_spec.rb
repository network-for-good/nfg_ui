require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Alert do
  let(:alert) { FactoryBot.build(:bootstrap_alert, **options) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }

  describe 'default class construction' do
    let(:options) { {} }
    it 'contains only the public methods and options it is expected to' do
      expect(alert.options).to eq(class: '', id: nil, body: nil, data: nil, traits: [])
      expect(alert.view_context).to be
      expect(alert.id).to be_nil
      expect(alert.data).to be_nil
      expect(alert.body).to be_nil
    end
  end

  describe '#assistive_html_attributes' do
    subject { alert.send(:assistive_html_attributes) }
    it { is_expected.to eq(role: 'alert') }
  end

  describe 'Dismissible module included in Alert' do
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Dismissible }
    it 'responds to the dismissible public methods' do
      expect(alert).to respond_to :dismissible, :dismissible?
    end
  end

  describe 'Themeable module included in Alert' do
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Themeable }
    it 'responds to the themeable public methods' do
      expect(alert).to respond_to :theme, :outlined
    end
  end
end
