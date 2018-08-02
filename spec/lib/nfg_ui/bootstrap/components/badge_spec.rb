require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Badge do
  let(:badge) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { { pill: pill_presence } }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }

  describe 'default class construction' do
    let(:options) { {} }
    it 'contains only the public methods and options it is expected to' do
      expect(badge.options).to eq(class: '', id: nil, body: nil, data: nil)
      expect(badge.view_context).to be
      expect(badge.id).to be_nil
      expect(badge.data).to be_nil
      expect(badge.body).to be_nil
    end
  end

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
      it { is_expected.to eq 'badge badge-primary badge-pill' }
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

  it_behaves_like 'a component that includes the Themeable utility module'
  it_behaves_like 'a component that includes the Wrappable utility module'
end
