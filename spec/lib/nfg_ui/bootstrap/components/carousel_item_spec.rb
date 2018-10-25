require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::CarouselItem do
  let(:carousel_item) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Activatable utility module'

  describe '#caption' do
    subject { carousel_item.caption }
    context 'when a caption is present in the options' do
      let(:tested_caption) { 'tested caption' }
      let(:options) { { caption: tested_caption } }
      it { is_expected.to eq tested_caption }
    end

    context 'when caption is not present in the options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end

    context 'when caption is nil in the options' do
      let(:options) { { caption: nil } }
      it { is_expected.to be_nil }
    end
  end

  describe '#component_family' do
    subject { carousel_item.component_family }
    it { is_expected.to eq :carousel }
  end

  describe '#image' do
    subject { carousel_item.image }

    context 'when image is present in options' do
      let(:tested_image) { 'img.png' }
      let(:options) { { image: tested_image } }
      it { is_expected.to eq tested_image }
    end

    context 'when image is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end

    context 'when image is nil in options' do
      let(:options) { { image: nil } }
      it { is_expected.to be_nil }
    end
  end

  describe '#label' do
    subject { carousel_item.label }

    context 'when label is present in options' do
      let(:tested_label) { 'tested label' }
      let(:options) { { label: tested_label } }
      it { is_expected.to eq tested_label }
    end

    context 'when label is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end

    context 'when label is nil in options' do
      let(:options) { { label: nil } }
      it { is_expected.to be_nil }
    end
  end

  describe 'private methods' do
    describe '#non_html_attribute_options' do
      subject { carousel_item.send(:non_html_attribute_options) }
      it { is_expected.to include :image, :caption, :label }
    end
  end
end
