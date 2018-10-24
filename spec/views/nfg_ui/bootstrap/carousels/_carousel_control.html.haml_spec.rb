require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/carousels/_carousel_control.html.haml', type: :view do
  let(:carousel_control) { FactoryBot.create(:bootstrap_carousel_control, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/carousels/carousel_control', carousel_control: carousel_control }

  describe 'html output for the bootstrap carousel-control' do
    it 'outputs a bootstrap carousel-control component in html' do
      expect(subject).to have_selector '.carousel-control'
      expect(subject).to eq "<a class='carousel-control' href='#' role='button'>\n</a>\n"
    end
  end

  describe 'a carousel control with controls set' do
    context 'when control is set in options' do
      describe 'a properly setup carousel control' do    
        let(:tested_control) { :prev }
        let(:tested_carousel) { '#test_carousel' }
        let(:options) { { control: tested_control, carousel: tested_carousel } }

        it 'outputs a link with the intended control in place' do
          expect(subject).to have_css "a.carousel-control-#{tested_control}[data-slide=#{tested_control}]"
          expect(subject).to have_css ".carousel-control-#{tested_control}-icon"
          expect(subject).to eq "<a class='carousel-control-#{tested_control}' data-slide='prev' href='#{tested_carousel}' role='button'>\n<span aria-hidden class='carousel-control-#{tested_control}-icon'></span>\n<span class='sr-only'>#{tested_control.to_s}</span>\n</a>\n"
        end
      end
    end

    context 'when a control is not set in options' do
      let(:options) { {} }
      it 'does not implement a direction specific control' do
        expect(subject).to eq "<a class='carousel-control' href='#' role='button'>\n</a>\n"
      end
    end
  end

  describe 'identifying the target carousel to control' do
    context 'when a carousel is identified in options' do
      let(:tested_carousel) { '#tested_carousel' }
      let(:options) { { carousel: tested_carousel } }
      it 'connects the control to the carousel' do
        expect(subject).to have_css "a[href='#{tested_carousel}']"
        expect(subject).to eq "<a class='carousel-control' href='#{tested_carousel}' role='button'>\n</a>\n"
      end
    end

    context 'when a carousel is not identified in options' do
      it 'outputs the control with a fallback href' do
        expect(subject).to have_css "a[href='#']"
        expect(subject).to eq "<a class='carousel-control' href='#' role='button'>\n</a>\n"
      end
    end
  end
end
