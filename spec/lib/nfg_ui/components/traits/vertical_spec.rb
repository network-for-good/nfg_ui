require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Vertical do
  let(:component_with_traits) { nil }
  let(:options) { {} }
  let(:traits) { [] }

  pending 'Vertical spec is needed'

  describe 'registered traits' do
    subject { described_class::TRAITS }
  end

  describe '#vertical_trait' do
    subject { component_with_traits.vertical_trait }
  end
end
