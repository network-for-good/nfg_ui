require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Dismissible do
  # Alert is dismissible
  let(:alert) { FactoryBot.create(:bootstrap_alert, **options) }
  let(:options) { { dismissible: tested_dismissible } }
  let(:tested_dismissible) { nil }

  describe '#dismissible' do
    subject { alert.dismissible }
    context 'when :dismissible is true' do
      let(:tested_dismissible) { true }
      it { is_expected.to be }
    end

    context 'when :dismissible is false' do
      let(:tested_dismissible) { false }
      it { is_expected.to be false }
    end

    context 'when dismissible is nil' do
      let(:tested_dismissible) { nil }
      it { is_expected.to be_nil }
    end

    context 'when dismissible is not present' do
      let(:options) { {} }
      it { is_expected.to be true }
    end
  end

  describe '#non_html_attribute_options' do
    subject { alert.send(:non_html_attribute_options) }
    it { is_expected.to include :dismissible }
  end

  describe '#default_dismissible' do
    subject { alert.send(:default_dismissible) }
    it { is_expected.to be true }
  end
end
