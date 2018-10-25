require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/carousels/_carousel_caption.html.haml', type: :view do
  let(:carousel_caption) { FactoryBot.create(:bootstrap_carousel_caption, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/carousels/carousel_caption', carousel_caption: carousel_caption }

  describe 'html output for the bootstrap carousel-caption' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap carousel-caption component in html' do
      expect(subject).to have_selector '.carousel-caption', text: body
      expect(subject).to eq "<div class='carousel-caption'>\n#{body}\n</div>\n"
    end
  end

  describe 'carousel caption labels' do
    context 'when a label is present in options' do
      let(:tested_label) { 'tested label' }
      let(:tested_caption) { 'tested caption' }
      context 'when only a label is present in options' do
        let(:options) { { label: tested_label } }
        it 'outputs the label only' do
          expect(subject).to have_selector '.carousel-caption h5', text: tested_label
          expect(subject).to eq "<div class='carousel-caption'>\n<h5>#{tested_label}</h5>\n\n</div>\n"
        end
      end

      context 'when a label and body are present in options' do
        let(:options) { { label: tested_label, body: tested_caption } }
        it 'outputs both the label and the caption body' do
          expect(subject).to have_selector 'h5', text: tested_label
          expect(subject).to have_text tested_caption
          expect(subject).to eq "<div class='carousel-caption'>\n<h5>#{tested_label}</h5>\n#{tested_caption}\n</div>\n"
        end
      end
    end

    context 'when a label is not present in options' do
      let(:options) { {} }
      it 'does not output a label' do
        expect(subject).to eq "<div class='carousel-caption'>\n\n</div>\n"
      end
    end
  end
end
