require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Size do
  let(:component_with_traits) { NfgUi::Components::Elements::Avatar.new(options.merge!(traits: traits), ActionController::Base.new.view_context) }
  let(:options) { {} }
  let(:traits) { [size] }

  describe 'registered traits' do
    subject { described_class::TRAITS }
    it { is_expected.to eq %i[sm md lg xl] }
  end

  describe '#sm_trait' do
    subject { component_with_traits.sm_trait }
    let(:size) { :sm }
    it { expect(component_with_traits.options[:size]).to eq size }
  end

  describe '#md_trait' do
    subject { component_with_traits.md_trait }
    let(:size) { :md }
    it { expect(component_with_traits.options[:size]).to eq size }
  end

  describe '#lg_trait' do
    subject { component_with_traits.lg_trait }
    let(:size) { :lg }
    it { expect(component_with_traits.options[:size]).to eq size }
  end

  describe '#xl_trait' do
    subject { component_with_traits.xl_trait }
    let(:size) { :xl }
    it { expect(component_with_traits.options[:size]).to eq size }
  end
end
