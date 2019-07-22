require 'rails_helper'

RSpec.describe NfgUi::Components::Foundations::Image do
  let(:image) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  let(:traits) { [] }
  let(:image_path) { "#{NfgUi::Engine.root}/spec/fixtures/images/sample_image.jpg" }

  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Tooltipable utility module', component_suite: :nfg

  it { expect(described_class).to be < NfgUi::Components::Base }

  describe '#css_classes' do
    let(:options) { { responsive: tested_responsive } }
    let(:tested_responsive) { nil }
    subject { image.send(:css_classes) }

    it 'does not include the component name as a css class' do
      expect(subject).not_to include 'image'
    end

    context 'when :responsive is true in options' do
      let(:tested_responsive) { true }

      it { is_expected.to include 'img-fluid' }
    end

    context 'when :responsive is falsey in options' do
      let(:tested_responsive) { false }
      it { is_expected.not_to include 'img-fluid' }
    end
  end

  describe '#image' do
    let(:options) { { image: tested_image } }
    let(:tested_image) { nil }
    subject { image.image }

    context 'when :image is present in options' do
      let(:tested_image) { "spec/fixtures/images/sample_image.jpg" }
      it { is_expected.to eq tested_image }
    end

    context 'when :image is nil in options' do
      let(:tested_image) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :image is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#render' do
    let(:options) { {} }
    subject { image.render }

    it 'renders a responsive image by default' do
      expect(subject).to eq "<img class=\"img-fluid\" src=\"\" />"
    end

    describe 'tooltipped image' do
      let(:tested_tooltip) { 'tested tooltip' }
      let(:options) { { tooltip: tested_tooltip } }

      it 'includes the tooltip' do
        expect(subject).to include "title=\"#{tested_tooltip}\"", "data-toggle=\"tooltip\""
      end
    end

    describe 'providing the image path to the image component' do
      context 'using :image for the image path' do
        let(:options) { { image: image_path } }
        it 'renders the image with the correct src' do
          expect(subject).to eq "<img class=\"img-fluid\" src=\"#{image_path}\" />"
        end
      end

      context 'using :src for the image path' do
        let(:options) { { src: image_path } }
        it 'renders the image with the correct src' do
          expect(subject).to eq "<img class=\"img-fluid\" src=\"#{image_path}\" />"
        end
      end
    end
  end

  describe '#responsive' do
    let(:tested_responsive) { nil }
    let(:options) { { responsive: tested_responsive } }
    subject { image.responsive }

    context 'when :responsive is true in options' do
      let(:tested_responsive) { true }
      it { is_expected.to be }
    end

    context 'when :responsive is nil in options' do
      let(:tested_responsive) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :responsive is false in options' do
      let(:tested_responsive) { false }
      it { is_expected.to eq false }
    end

    context 'when :responsive is not present in options' do
      let(:options) { {} }
      it 'utilizes the #default_responsive value' do
        expect(subject).to eq true
      end
    end
  end

  describe '#src' do
    let(:tested_src) { nil }
    let(:options) { { src: tested_src } }
    subject { image.src }

    context 'when :src is present in options' do
      let(:tested_src) { "spec/fixtures/images/sample_image.jpg" }
      it { is_expected.to eq tested_src }
    end

    context 'when :src is nil in options' do
      let(:tested_src) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :src is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end

    context 'when both :src and :image are in options' do
      let(:tested_src) { 'tested_src/tested_src.jpg' }
      let(:tested_image) { 'tested_image/tested_image.jpg' }
      let(:options) { { tested_image: tested_image, src: tested_src } }

      it 'prioritizes :src and ignores :image' do
        expect(subject).to eq tested_src
      end
    end
  end

  describe 'private methods' do
    describe '#component_css_class' do
      subject { image.send(:component_css_class) }
      it { is_expected.to be_empty }
    end

    describe '#default_responsive' do
      subject { image.send(:default_responsive) }
      it { is_expected.to be }
    end

    describe '#image_location' do
      subject { image.send(:image_location) }

      context 'when src is present' do
        context 'and when image.src is present via the :image option' do
          let(:options) { { image: image_path } }
          it 'is the :image string' do
            expect(subject).to eq image_path

            and_it 'is the image src' do
              expect(image.src).to eq image_path
            end
          end
        end

        context 'and when :src is present via the :src option' do
          let(:options) { { src: image_path } }
          it 'is the :src string' do
            expect(subject).to eq image_path

            and_it 'is the image src' do
              expect(image.src).to eq image_path
            end
          end
        end
      end

      context 'when src is not present' do
        let(:options) { { src: nil, image: nil } }
        it 'is an empty string to prevent invalid asset error' do
          expect(subject).to be_empty
        end
      end
    end

    describe '#non_html_attribute_options' do
      subject { image.send(:non_html_attribute_options) }
      it { is_expected.to include :image, :src, :responsive }
    end
  end
end