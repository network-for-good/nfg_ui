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
end
