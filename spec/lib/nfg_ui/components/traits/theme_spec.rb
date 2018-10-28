require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Theme do
  let(:component_with_traits) { nil }
  let(:options) { {} }
  let(:traits) { [] }

  pending 'trait spec is needed'

  describe 'registered traits' do
    subject { described_class::TRAITS }
  end

  describe '#primary_trait' do
    subject { component_with_traits.primary_trait }
  end

  describe '#secondary_trait' do
    subject { component_with_traits.secondary_trait }
  end

  describe '#success_trait' do
    subject { component_with_traits.success_trait }
  end

  describe '#danger_trait' do
    subject { component_with_traits.danger_trait }
  end

  describe '#warning_trait' do
    subject { component_with_traits.warning_trait }
  end

  describe '#info_trait' do
    subject { component_with_traits.info_trait }
  end

  describe '#light_trait' do
    subject { component_with_traits.light_trait }
  end

  describe '#dark_trait' do
    subject { component_with_traits.dark_trait }
  end
end
