require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/carousels/_carousel_indicators.html.haml', type: :view do
  let(:carousel_indicators) { FactoryBot.create(:bootstrap_carousel_indicators, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/carousels/carousel_indicators', carousel_indicators: carousel_indicators }

  describe 'html output for the bootstrap carousel-indicators' do
    it 'outputs a bootstrap carousel-indicators component in html' do
      expect(subject).to have_selector '.carousel-indicators'
      expect(subject).to eq "<ol class='carousel-indicators'>\n</ol>\n"
    end
  end

  describe 'carousel indicators with a count' do
    let(:tested_count) { 2 }
    let(:options) { { count: tested_count } }
    it { is_expected.to have_css "[data-slide-to]", count: tested_count }
  end

  describe 'setting an active carousel indicator' do
    context 'when an active indicator is not set' do
      let(:options) { { count: 3 } }
      it 'automatically sets the first indicator to active' do
        expect(subject).to have_css ".active[data-slide-to='0']"
        expect(subject).not_to have_css ".active[data-slide-to='1']"
        expect(subject).not_to have_css ".active[data-slide-to='2']"
      end
    end

    context 'when an active indicator is set' do
      let(:options) { { count: 3, active: 2 } }
      it 'automatically sets the first indicator to active' do
        expect(subject).not_to have_css ".active[data-slide-to='0']"
        expect(subject).to have_css ".active[data-slide-to='1']"
        expect(subject).not_to have_css ".active[data-slide-to='2']"
      end
    end
  end

  describe 'supplying the carousel that is indicated' do
    context 'when the target carousel is supplied' do
      let(:tested_carousel) { '#test_carousel' }
      let(:options) { { count: 1, carousel: tested_carousel } }
      it 'applies the carousel target as the data-target of the indicator' do
        expect(subject).to have_css ".carousel-indicators [data-target='#{tested_carousel}'][data-slide-to]"
        expect(subject).to eq "<ol class='carousel-indicators'>\n<li class='active' data-slide-to='0' data-target='#test_carousel'></li>\n</ol>\n"
      end
    end

    context 'when the target carousel is not supplied' do
      let(:options) { { count: 1 } }
      it 'outputs a target-less indicator' do
        expect(subject).not_to have_css ".carousel-indicators [data-target]"
        expect(subject).to eq "<ol class='carousel-indicators'>\n<li class='active' data-slide-to='0'></li>\n</ol>\n"
      end
    end
  end
end
