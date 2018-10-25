require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::CarouselCaption do
  let(:carousel_caption) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { carousel_caption.component_family }
    it { is_expected.to eq :carousel }
  end

  describe '#label' do
    subject { carousel_caption.label }
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
      subject { carousel_caption.send(:non_html_attribute_options) }
      it { is_expected.to include :label }
    end
  end
end
