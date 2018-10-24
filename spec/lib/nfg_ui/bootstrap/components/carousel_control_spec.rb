require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::CarouselControl do
  let(:carousel_control) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#body' do
    subject { carousel_control.body }
    it { is_expected.to be_nil }
  end

  describe '#component_family' do
    subject { carousel_control.component_family }
    it { is_expected.to eq :carousel }
  end

  describe '#carousel' do
    subject { carousel_control.carousel }

    context 'when carousel is present in options' do
      let(:tested_carousel) { '#tested_carousel' }
      let(:options) { { carousel: tested_carousel } }
      it { is_expected.to eq tested_carousel }
    end

    context 'when carousel is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#control' do
    subject { carousel_control.control }
    context 'when control is present in options' do
      let(:tested_control) { :prev }
      let(:options) { { control: tested_control } }
      it { is_expected.to eq :prev }
    end

    context 'when control is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#data' do
    subject { carousel_control.data }
    context 'when control is present' do
      let(:tested_control) { :prev }
      let(:options) { { control: tested_control } }
      it { is_expected.to eq(slide: tested_control) }
    end

    context 'when control is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq({}) }
    end

    context 'when control is false in options' do
      let(:options) { { control: false } }
      it { is_expected.to eq({}) }
    end

    context 'when control is nil in options' do
      let(:options) { { control: nil } }
      it { is_expected.to eq({}) }
    end

    context 'and when additional data attributes are present' do
      let(:tested_data) { { tested: :data } }
      let(:tested_control) { :prev }
      let(:options) { { data: tested_data, control: tested_control } }
      it { is_expected.to eq(**tested_data, slide: tested_control) }
    end
  end

  describe '#href' do
    let(:tested_carousel) { '#tested_carousel' }
    subject { carousel_control.href }

    context 'when carousel is present in options' do
      let(:options) { { carousel: tested_carousel } }
      it { is_expected.to eq tested_carousel }
    end

    context 'when carousel is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq '#' }
    end

    context 'when carousel is false in options' do
      let(:options) { { carousel: false } }
      it { is_expected.to eq '#' }
    end

    context 'when carousel is nil in options' do
      let(:options) { { carousel: nil } }
      it { is_expected.to eq '#' }
    end
  end

  describe '#icon_html_options' do
    subject { carousel_control.icon_html_options }

    context 'when control is present' do
      let(:tested_control) { :prev }
      let(:options) { { control: tested_control } }
      it { is_expected.to eq(class: "carousel-control-prev-icon", aria: { hidden: true }) }
    end

    context 'when control is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq({}) }
    end

    context 'when control is false in options' do
      let(:options) { { carousel: false } }
      it { is_expected.to eq({}) }
    end

    context 'when control is nil in options' do
      let(:options) { { carousel: nil } }
      it { is_expected.to eq({}) }
    end
  end

  describe 'private methods' do
    describe '#assistive_html_attributes' do
      subject { carousel_control.send(:assistive_html_attributes) }
      let(:options) { {} }
      it { is_expected.to eq(role: 'button') }
    end

    describe '#component_css_class' do
      subject { carousel_control.send(:component_css_class) }

      context 'when control is present in options' do
        let(:tested_control) { :prev }
        let(:options) { { control: tested_control } }
        
        it 'hijacks the standard component css class' do
          expect(subject).to eq "carousel-control-#{tested_control}"
        end
      end

      context 'when control is not present in options' do
        let(:options) { {} }
        it { is_expected.to eq 'carousel-control' }
      end
    end

    describe '#non_html_attribute_options' do
      subject { carousel_control.send(:non_html_attribute_options) }
      it { is_expected.to include :control, :carousel }
    end
  end
end
