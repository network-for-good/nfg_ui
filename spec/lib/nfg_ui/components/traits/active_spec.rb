require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Active do
  let(:component_with_traits) { nil }
  let(:options) { {} }
  let(:traits) { [] }

  pending 'Active spec is needed'

  describe 'registered traits' do
    subject { described_class::TRAITS }
  end

  describe '#active_trait' do
    subject { component_with_traits.active_trait }
  end
end
