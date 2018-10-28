require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Size do
  let(:component_with_traits) { nil }
  let(:options) { {} }
  let(:traits) { [] }

  pending 'trait spec is needed'

  describe 'registered traits' do
    subject { described_class::TRAITS }
  end

  describe '#lg_trait' do
    subject { component_with_traits.lg_trait }
  end

  describe '#sm_trait' do
    subject { component_with_traits.sm_trait }
  end
end
