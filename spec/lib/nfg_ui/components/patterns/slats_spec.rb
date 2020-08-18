require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::Slats do
  let(:slats) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  it_behaves_like 'a component that includes the Sizable utility module', component_suite: :nfg

  it_behaves_like 'a component that includes the Size trait module'

  it { expect(described_class.included_modules).to include NfgUi::Components::Traits::Slats }

  describe '#nowrap' do
    let(:tested_option) { :nowrap }
    subject { slats.nowrap }
    it_behaves_like 'a fetched option with a defined fallback', fallback: false
  end

  describe '#slat_actions' do
    let(:tested_option) { :slat_actions }
    subject { slats.slat_actions }
    it_behaves_like 'an option with a value', fallback: nil

    context 'when the tested option is not present in the :options hash' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe 'private methods' do
    describe '#css_classes' do
      subject { slats.send(:css_classes) }

      describe ':nowrap impact on css_classes' do
        let(:options) { { nowrap: tested_nowrap } }

        context 'when :nowrap is true' do
          let(:tested_nowrap) { true }
          it { is_expected.to include 'slats-nowrap' }
        end

        context 'when :nowrap is falsy' do
          let(:tested_nowrap) { false }
          it { is_expected.not_to include 'slats-nowrap' }
        end
      end

      describe ':slat_actions impact on css classes' do
        let(:options) { { slat_actions: tested_slat_actions_size } }
        context 'when slat_actions are included on the :slat_actions_resized? list' do
          let(:tested_slat_actions_size) { :sm }
          it { is_expected.to include "slat-actions-#{tested_slat_actions_size}" }
        end

        context 'when slat_actions are not included on the :slat_actions_resized? list' do
          let(:tested_slat_actions_size) { :arbitrary }
          it { is_expected.not_to include "slat-actions-#{tested_slat_actions_size}" }
          it { is_expected.not_to include "slat-actions-" }
        end
      end
    end

    describe '#slat_actions_resized?' do
      subject { slats.send(:slat_actions_resized?) }
      let(:options) { { slat_actions: tested_slat_actions } }

      context 'when the symbol is included in the array' do
        context 'when it is :sm' do
          let(:tested_slat_actions) { :sm }
          it { is_expected.to be }
        end

        context 'when it is :lg' do
          let(:tested_slat_actions) { :lg }
          it { is_expected.to be }
        end

        context 'when it is :none' do
          let(:tested_slat_actions) { :none }
          it { is_expected.to be }
        end

      end

      context 'when the symbol is not included in the array' do
        let(:tested_slat_actions) { :arbitrary }
        it { is_expected.to be_falsy }
      end
    end
  end
end
