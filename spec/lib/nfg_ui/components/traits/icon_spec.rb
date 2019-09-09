require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Icon do
  let(:component_with_traits) { FactoryBot.create(:icon, options: options) }
  let(:options) { {} }

  describe 'registered traits' do
    subject { described_class::TRAITS }
    it { is_expected.to eq %i[loader tip] }
  end

  describe '#loader_trait' do
    subject { component_with_traits.loader_trait }
    it 'updates the icon to use a spinning spinner' do
      by 'not updating the icon before the trait is applied' do
        expect(component_with_traits.icon).not_to eq 'spinner spin fw'
      end

      and_by 'running the trait' do
        subject # run the trait
      end

      and_it 'is the correct icon' do
        expect(component_with_traits.icon).to eq 'spinner spin fw'
      end
    end
  end

  describe '#tip_trait' do
    subject { component_with_traits.tip_trait }
    it 'establishes the tip icon with correct options' do
      by 'not being updated before running the trait' do
        expect(component_with_traits.icon).not_to eq 'question-circle-o'
        expect(component_with_traits.theme).not_to eq :info
      end

      and_by 'running the trait' do
        subject # run the trait
      end

      and_it 'is the correct icon' do
        expect(component_with_traits.icon).to eq 'question-circle-o'
      end

      and_it 'is the correct theme' do
        expect(component_with_traits.theme).to eq :info
      end
    end
  end
end
