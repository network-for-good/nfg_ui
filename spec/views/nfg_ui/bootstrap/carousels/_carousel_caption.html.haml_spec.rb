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
end
