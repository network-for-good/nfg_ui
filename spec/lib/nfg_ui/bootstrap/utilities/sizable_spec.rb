require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Sizable do
  # Button is sizable
  let(:button) { FactoryBot.create(:bootstrap_button, **options) }
  let(:options) { { size: tested_size } }
  let(:tested_size) { nil }

  describe '#size' do
    let(:tested_size) { :sm }
    subject { button.size }
    it { is_expected.to eq tested_size }
  end

  describe '#resized?' do
    subject { button.send(:resized?) }
    context 'when size is :sm' do
      let(:tested_size) { :sm }
      it { is_expected.to be }
    end

    context 'when size is :lg' do
      let(:tested_size) { :lg }
      it { is_expected.to be }
    end

    context 'when size is not :sm or :lg' do
      let(:tested_size) { :invalid }
      it { is_expected.to be false }
    end

    context 'when size is nil' do
      let(:tested_size) { nil }

      it { is_expected.to be_falsey }
    end
  end

  describe '#non_html_attribute_options' do
    subject { button.send(:non_html_attribute_options) }
    it { is_expected.to include :size }
  end
end
