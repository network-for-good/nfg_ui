require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Disableable do
  # Button is disableable
  let(:button) { FactoryBot.create(:bootstrap_button, **options) }
  let(:options) { { disabled: tested_disabled } }
  let(:tested_disabled) { nil }

  describe '#disabled' do
    subject { button.disabled }
    context 'when disabled is true in options' do
      let(:tested_disabled) { true }
      it { is_expected.to be }
    end

    context 'when disabled is false in options' do
      let(:tested_disabled) { false }
      it { is_expected.to be false }
    end

    context 'when disabled is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_falsey }
    end
  end

  describe '#css_classes' do
    subject { button.send(:css_classes) }
    context 'when component has :disabled in options' do
      context 'when component has disabled: true' do
        let(:tested_disabled) { true }
        it { is_expected.to include 'disabled' }
      end

      context 'when component has disabled: false' do
        let(:tested_disabled) { false }
        it { is_expected.not_to include 'disabled' }

      end
    end

    context 'when component does not have :disabled in options' do
      let(:options) { {} }
      it { is_expected.not_to include 'disabled' }
    end
  end

  describe '#non_html_attribute_options' do
    subject { button.send(:non_html_attribute_options) }
    context 'when :as is not :button' do
      let(:options) { { as: :strong } }
      it { is_expected.to include :disabled }
    end

    context 'when :as is :button' do
      let(:options) { { as: :button } }
      it { is_expected.not_to include :disabled }
    end
  end

  describe '#assistive_html_attributes' do
    subject { button.send(:assistive_html_attributes) }
    context 'when the component is disabled' do
      let(:tested_disabled) { true }
      it { is_expected.to include tabindex: '-1' }
    end

    context 'when the component is not disabled' do
      let(:tested_disabled) { false }
      it { is_expected.not_to include tabindex: '-1' }
    end

    context 'when the component has not established disabled state' do
      let(:options) { {} }
      it { is_expected.not_to include tabindex: '-1' }
    end
  end
end
