require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::CarouselIndicators do
  let(:carousel_indicators) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#active' do
    subject { carousel_indicators.active }
    context 'when active is supplied in the optoins' do
      let(:tested_active) { 2 }
      let(:options) { { active: tested_active } }
      it { is_expected.to eq tested_active }
    end

    context 'when active is not supplied in the options' do
      let(:options) { {} }
      it { is_expected.to eq 1 }
    end

    context 'when active is nil in the options' do
      let(:options) { { active: nil } }
      it { is_expected.to be_nil }
    end
  end

  describe '#body' do
    subject { carousel_indicators.body }
    it { is_expected.to be_nil }
  end

  describe '#component_family' do
    subject { carousel_indicators.component_family }
    it { is_expected.to eq :carousel }
  end

  describe '#count' do
    subject { carousel_indicators.count }
    context 'when count is supplied in the optoins' do
      let(:tested_count) { 2 }
      let(:options) { { count: tested_count } }
      it { is_expected.to eq tested_count }
    end

    context 'when count is not supplied in the options' do
      let(:options) { {} }
      it { is_expected.to eq 0 }
    end

    context 'when count is nil in the options' do
      let(:options) { { count: nil } }
      it { is_expected.to eq 0 }
    end
  end

  describe '#carousel' do
    subject { carousel_indicators.carousel }
    context 'when carousel is supplied in the optoins' do
      let(:tested_carousel) { '#tested_carousel' }
      let(:options) { { carousel: tested_carousel } }
      it { is_expected.to eq tested_carousel }
    end

    context 'when carousel is not supplied in the options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end

    context 'when carousel is nil in the options' do
      let(:options) { { carousel: nil } }
      it { is_expected.to be_nil }
    end
  end

  describe 'private methods' do
    describe '#non_html_attribute_options' do
      subject { carousel_indicators.send(:non_html_attribute_options) }
      it { is_expected.to include :active, :count, :carousel }
    end
  end
end
