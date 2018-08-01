require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_carousel.html.haml', type: :view do
  let(:carousel) { FactoryBot.create(:bootstrap_carousel, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/carousel', carousel: carousel }

  describe 'html output for the bootstrap carousel' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap carousel component in html' do
      expect(subject).to have_css '.carousel .carousel-inner'
      expect(subject).to have_selector '.carousel .carousel-inner', text: body
      expect(subject).to eq "<div class='carousel'>\n<div class='carousel-inner'>\n#{body}\n</div>\n</div>\n"
    end
  end
end
