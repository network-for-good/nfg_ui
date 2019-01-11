require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Typeface do
  let(:component_with_traits) { nil }
  let(:options) { {} }
  let(:traits) { [] }

  pending 'trait spec is needed'

  describe 'registered traits' do
    subject { described_class::TRAITS }
  end

  describe '#body_trait' do
    subject { component_with_traits.body }
  end

  describe '#caption_trait' do
    subject { component_with_traits.caption_trait }
  end

  describe '#heading_trait' do
    subject { component_with_traits.heading_trait }
  end

  describe '#title_trait' do
    subject { component_with_traits.title_trait }
  end

  describe '#truncate_trait' do
    subject { component_with_traits.truncate_trait }
  end
end
