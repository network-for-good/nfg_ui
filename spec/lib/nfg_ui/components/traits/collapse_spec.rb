require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Collapse do
  let(:component_with_traits) { nil }
  let(:options) { {} }
  let(:traits) { [] }

  pending 'trait spec is needed'

  describe 'registered traits' do
    subject { described_class::TRAITS }
  end

  describe '#collapsible_trait' do
    subject { component_with_traits.send(:collapsible_trait) }
  end

  describe '#collapsed_trait' do
    subject { component_with_traits.send(:collapsed_trait) }
  end
end
