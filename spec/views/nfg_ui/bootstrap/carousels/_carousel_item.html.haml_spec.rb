require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/carousels/_carousel_item.html.haml', type: :view do
  let(:carousel_item) { FactoryBot.create(:bootstrap_carousel_item, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/carousels/carousel_item', carousel_item: carousel_item }

  describe 'html output for the bootstrap carousel-item' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap carousel-item component in html' do
      expect(subject).to have_selector '.carousel-item', text: body
      expect(subject).to eq "<div class='carousel-item'>\n#{body}\n</div>\n"
    end
  end

  describe 'active carousel item' do
    let(:options) { { active: true } }
    it 'outputs a carousel item that is set to active' do
      expect(subject).to have_css '.carousel-item.active'
      expect(subject).to eq "<div class='carousel-item active'>\n\n</div>\n"
    end
  end

  describe 'carousel item with an image url supplied' do
    let(:tested_image) { 'https://via.placeholder.com/600x400' }
    let(:options) { { image: tested_image } }
    context 'when an image url is supplied in the options' do
      it 'outputs an image with the correct css classes' do
        expect(subject).to have_css '.carousel-item img.d-block.w-100'
        expect(subject).to eq "<div class='carousel-item'>\n<img class=\"d-block w-100\" src=\"#{tested_image}\" />\n\n</div>\n"
      end

      context 'when a body is also supplied in addition to the image' do
        let(:tested_body) { 'Tested body' }
        let(:options) { { image: tested_image, body: tested_body } }
        it 'places the image before the supplied body' do
          expect(subject).to have_selector '.carousel-item img'
          expect(subject).to have_text tested_body
          expect(subject).to eq "<div class='carousel-item'>\n<img class=\"d-block w-100\" src=\"#{tested_image}\" />\n#{tested_body}\n</div>\n"
        end
      end
    end

    context 'when an image attribute is set to false' do
      let(:tested_image) { false }
      it 'does not output an image' do
        expect(subject).not_to have_css '.carousel-item img.d-block.w-100'
        expect(subject).to eq "<div class='carousel-item'>\n\n</div>\n"
      end
    end

    context 'when an image is not supplied in the options' do
      let(:options) { {} }
      it 'does not output an image' do
        expect(subject).not_to have_css '.carousel-item img.d-block.w-100'
        expect(subject).to eq "<div class='carousel-item'>\n\n</div>\n"
      end
    end
  end

  describe 'a carousel item with a caption passed in through options' do
    context 'when a label is present in options' do
      let(:tested_label) { 'Tested label' }
      let(:options) { { label: tested_label } }
      it 'outputs a caption label within the caption html' do
        expect(subject).to eq "<div class='carousel-item'>\n<div class='carousel-caption'>\n<h5>#{tested_label}</h5>\n\n</div>\n\n\n</div>\n"
      end
    end

    context 'when a caption is present in options' do
      let(:tested_caption) { 'tested caption' }
      let(:options) { { caption: tested_caption } }

      it 'outputs a carousel item with a caption' do
        expect(subject).to have_css '.carousel-item .carousel-caption', text: tested_caption
        expect(subject).to eq "<div class='carousel-item'>\n<div class='carousel-caption'>\n#{tested_caption}\n</div>\n\n\n</div>\n"
      end

      context 'when an image is supplied for the carousel item' do
        let(:tested_image) { 'https://via.placeholder.com/600x400' }
        let(:options) { { caption: tested_caption, image: tested_image } }
        it 'supplies the caption under the image' do
          expect(subject).to eq "<div class='carousel-item'>\n<img class=\"d-block w-100\" src=\"#{tested_image}\" />\n<div class='carousel-caption'>\n#{tested_caption}\n</div>\n\n\n</div>\n"
        end
      end

      context 'when a body is supplied to the carousel item' do
        let(:tested_body) { 'tested body' }
        let(:options) { { caption: tested_caption, body: tested_body } }
        it 'outputs the body after the caption' do
          expect(subject).to eq "<div class='carousel-item'>\n<div class='carousel-caption'>\n#{tested_caption}\n</div>\n\n#{tested_body}\n</div>\n"
        end
      end
    end

    context 'when caption is not present in options' do
      let(:options) { {} }
      it { is_expected.not_to have_css '.carousel-caption' }
    end
  end
end
