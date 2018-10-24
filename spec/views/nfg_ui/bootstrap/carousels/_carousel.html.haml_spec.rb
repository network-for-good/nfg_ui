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
end
