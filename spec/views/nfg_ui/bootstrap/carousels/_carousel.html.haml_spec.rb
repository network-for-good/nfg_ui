require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/carousels/_carousel.html.haml', type: :view do
  let(:carousel) { FactoryBot.create(:bootstrap_carousel, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/carousels/carousel', carousel: carousel }

  describe 'html output for the bootstrap carousel' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap carousel component in html' do
      expect(subject).to have_css '.carousel .carousel-inner'
      expect(subject).to have_selector '.carousel.slide .carousel-inner', text: body
      expect(subject).to eq "<div class='carousel slide' data-ride='carousel'>\n<div class='carousel-inner'>\n#{body}\n</div>\n</div>\n"
    end
  end

  describe 'a carousel with auto generated indicators via carousel :options' do
    context 'when an indicator count is present' do
      let(:tested_indicators) { 3 }
      let(:options) { { indicators: tested_indicators } }
      it 'outputs the requested amount of indicators' do
        expect(subject).to have_css "[data-slide-to]", count: tested_indicators
        expect(subject).to eq "<div class='carousel slide' data-ride='carousel'>\n<div class='carousel-inner'>\n<ol class=\"carousel-indicators\"><li class=\"active\" data-target=\"#\" data-slide-to=\"0\"></li><li data-target=\"#\" data-slide-to=\"1\"></li><li data-target=\"#\" data-slide-to=\"2\"></li></ol>\n\n</div>\n</div>\n"
      end
    end

    context 'when an indicator count is not present' do
      let(:options) { {} }
      it { is_expected.not_to have_css '.carousel-indicators' }
    end

    context 'when an indicator count is 0' do
      let(:options) { { indicators: 0 } }
      it { is_expected.not_to have_css '.carousel-indicators' }
    end
  end

  describe 'a carousel with auto generated controls via carousel :options' do
    context 'when controls is true in options' do
      let(:options) { { controls: true } }
      it 'outputs the next and previous controls for the carousel' do
        expect(subject).to have_css '.carousel-control-next'
        expect(subject).to have_css '.carousel-control-prev'
        expect(subject).to eq "<div class='carousel slide' data-ride='carousel'>\n<div class='carousel-inner'>\n\n<a class=\"carousel-control-next\" data-slide=\"next\" href=\"#\" role=\"button\"><span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span><span class=\"sr-only\">next</span></a>\n<a class=\"carousel-control-prev\" data-slide=\"prev\" href=\"#\" role=\"button\"><span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span><span class=\"sr-only\">prev</span></a>\n</div>\n</div>\n"
      end
    end

    context 'when controls is not present in options' do
      let(:options) { {} }
      it 'does not output the controls' do
        expect(subject).not_to have_css '.carousel-control-next'
        expect(subject).not_to have_css '.carousel-control-prev'
      end
    end

    context 'when controls is false in options' do
      let(:options) { { controls: false } }
      it 'does not output the controls' do
        expect(subject).not_to have_css '.carousel-control-next'
        expect(subject).not_to have_css '.carousel-control-prev'
      end
    end
  end
end
