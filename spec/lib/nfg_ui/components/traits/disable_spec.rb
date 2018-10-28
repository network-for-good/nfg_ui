require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Disable do
  let(:component_with_traits) { nil }
  let(:options) { {} }
  let(:traits) { [] }

  pending 'trait spec is needed'

  describe 'registered traits' do
    subject { described_class::TRAITS }
  end

  describe '#disable_trait' do
    subject { component_with_traits.send(:disable_trait) }
  end
end
