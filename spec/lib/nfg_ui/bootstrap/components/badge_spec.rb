require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Badge do
  let(:badge) { FactoryBot.build(:bootstrap_badge, **options) }
  let(:options) { { pill: pill_presence } }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }

  describe '#pill' do
    context 'when pill is true' do
      let(:pill_presence) { true }
      it { expect(badge.options[:pill]).to be }
    end

    context 'when pill is false' do
      let(:pill_presence) { false }
      it { expect(badge.options[:pill]).to be false }
    end

    context 'when pill is not present' do
      let(:pill_presence) { nil }
      it { expect(badge.options[:pill]).to be_falsey }
    end
  end

  describe '#css_classes' do
    subject { badge.send(:css_classes) }

    context 'when pill is true' do
      let(:pill_presence) { true }
      it { is_expected.to eq 'badge badge-pill' }
    end

    context 'when pill is determined false' do
      let(:pill_presence) { false }
    end
  end

  describe '#default_pill' do
    let(:pill_presence) { nil }
    subject { badge.send(:default_pill) }
    it { is_expected.to be false }
  end

  describe '#non_html_attribute_options' do
    subject { badge.send(:non_html_attribute_options) }

    context 'when pill is true' do
      let(:pill_presence) { true }
      it { is_expected.to include(:pill) }
    end

    context 'when pill is false' do
      let(:pill_presence) { false }
      it { is_expected.not_to include(:pill) }
    end
  end
end
