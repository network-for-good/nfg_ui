require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Carousel do
  let(:carousel) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { carousel.component_family }
    it { is_expected.to eq :carousel }
  end

  describe '#data' do
    subject { carousel.data }
    context 'when data attributes are currently present' do
      let(:tested_data) { { tested: 'data' } }
      let(:options) { { data: tested_data } }
      it { is_expected.to eq(**tested_data, ride: 'carousel') }
    end

    context 'when data attributes are not present' do
      let(:options) { {} }
      it { is_expected.to eq(ride: 'carousel') }
    end
  end

  describe '#indicators' do
    subject { carousel.indicators }
    context 'when an indicator count is present in options' do
      let(:tested_indicators) { 3 }
      let(:options) { { indicators: tested_indicators } }
      it { is_expected.to eq tested_indicators }
    end

    context 'when an indicator count is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq 0 }
    end

    context 'when an indicator count is nil in options' do
      let(:options) { { indicators: nil } }
      it { is_expected.to eq 0 }
    end
  end

  describe '#controls' do
    subject { carousel.controls }
    context 'when controls is true in options' do
      let(:options) { { controls: true } }
      it { is_expected.to be }
    end

    context 'when controls are not present in options' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end

    context 'when an controlers is nil in options' do
      let(:options) { { controls: nil } }
      it { is_expected.to be_nil }
    end
  end

  describe 'private methods' do
    describe '#css_classes' do
      subject { carousel.send(:css_classes) }
      it { is_expected.to eq 'carousel slide' }
    end

    describe '#non_html_attribute_options' do
      subject { carousel.send(:non_html_attribute_options) }
      it { is_expected.to include :indicators, :controls }
    end
  end
end
