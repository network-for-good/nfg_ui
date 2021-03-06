require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Alert do
  let(:component_with_traits) { FactoryBot.create(:alert, options: options) }
  let(:options) { {} }

  describe 'registered traits' do
    subject { described_class::TRAITS }
    it { is_expected.to eq %i[tip] }
  end

  describe '#tip_trait' do
    subject { component_with_traits.tip_trait }
    it 'establishes the tip alert with correct options' do
      by 'not being updated before running the trait' do
        expect(component_with_traits.icon).not_to eq NfgUi::DEFAULT_TIP_ICON
        expect(component_with_traits.theme).not_to eq NfgUi::DEFAULT_TIP_THEME
      end

      and_by 'running the trait' do
        subject # run the trait
      end

      and_it 'applies the correct icon' do
        expect(component_with_traits.icon).to eq NfgUi::DEFAULT_TIP_ICON
      end

      and_it 'applies the correct theme' do
        expect(component_with_traits.theme).to eq NfgUi::DEFAULT_TIP_THEME
      end

      and_it 'is not a dismissible alert' do
        expect(component_with_traits.dismissible).to eq false
      end
    end
  end
end
