require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::PageHeader do
  let(:component_with_traits) { FactoryBot.create(:page_header, *traits, **options) }
  let(:options) { {} }
  let(:traits) { [] }

  describe 'registered traits' do
    subject { described_class::TRAITS }
    it { is_expected.to eq %i[sticky] }
  end

  describe '#sticky_trait' do
    subject { component_with_traits.sticky_trait }
  end
end
