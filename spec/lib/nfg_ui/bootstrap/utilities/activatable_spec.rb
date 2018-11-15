require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Activatable do
  # Breadcrumb Item is activatable
  let(:breadcrumb_item) { FactoryBot.create(:bootstrap_breadcrumb_item, **options) }
  let(:options) { { active: tested_active } }
  let(:tested_active) { nil }

  describe '#active' do
    subject { breadcrumb_item.active }

    context 'when component sets :active as true' do
      let(:tested_active) { true }
      it { is_expected.to be }
    end

    context 'when component sets :active as false' do
      let(:tested_active) { false }
      it { is_expected.to be false }
    end

    context 'when component sets :active as nil' do
      let(:tested_active) { nil }
      it { is_expected.to be_falsey }
    end

    context 'when :active is not present in options' do
      let(:options) { {} }
      it { is_expected.to be false }
    end
  end

  describe '#css_classes' do
    subject { breadcrumb_item.send(:css_classes) }
    context 'when component has :active as true' do
      let(:tested_active) { true }
      it { is_expected.to eq 'breadcrumb-item active' }
    end

    context 'when component has :active as false' do
      let(:tested_active) { false }
      it { is_expected.to eq 'breadcrumb-item' }
      it { is_expected.not_to include 'active' }
    end

    context 'when component does not have :active in the options' do
      let(:options) { {} }
      it { is_expected.to eq 'breadcrumb-item' }
      it { is_expected.not_to eq 'active' }
    end
  end

  describe '#non_html_attribute_options' do
    subject { breadcrumb_item.send(:non_html_attribute_options) }
    it { is_expected.to include :active }
  end

  describe '#default_active' do
    subject { breadcrumb_item.send(:default_active) }
    it { is_expected.to be false }
  end
end
