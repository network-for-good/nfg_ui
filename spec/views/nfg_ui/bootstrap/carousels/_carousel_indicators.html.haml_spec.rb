require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/carousels/_carousel_indicators.html.haml', type: :view do
  let(:carousel_indicators) { FactoryBot.create(:bootstrap_carousel_indicators, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/carousels/carousel_indicators', carousel_indicators: carousel_indicators }

  describe 'html output for the bootstrap carousel-indicators' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap carousel-indicators component in html' do
      expect(subject).to have_selector '.carousel-indicators', text: body
      expect(subject).to eq "<div class='carousel-indicators'>\n#{body}\n</div>\n"
    end
  end

  describe 'carousel indicators with a count' do
    let(:tested_count) { 2 }
    let(:options) { { count: tested_count } }
    it { is_expected.to have_css "[data-slide-to]", count: tested_count }
  end

  # More needed
end
