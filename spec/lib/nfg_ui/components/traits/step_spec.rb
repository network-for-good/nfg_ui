require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Step do
  let(:component_with_traits) { FactoryBot.create(:step, **options) }
  let(:options) { {} }
  let(:traits) { [] }

  describe 'registered traits' do
    subject { described_class::TRAITS }
    it { is_expected.to eq [:visited] }
  end

  describe '#visited_trait' do
    subject { component_with_traits.visited_trait }
    it 'sets :visited to true in options' do
      subject
      expect(component_with_traits.options[:visited]).to eq true
    end
  end
end
