require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/carousels/_carousel_control.html.haml', type: :view do
  let(:carousel_control) { FactoryBot.create(:bootstrap_carousel_control, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/carousels/carousel_control', carousel_control: carousel_control }

  describe 'html output for the bootstrap carousel-control' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap carousel-control component in html' do
      expect(subject).to have_selector '.carousel-control', text: body
      expect(subject).to eq "<div class='carousel-control'>\n#{body}\n</div>\n"
    end
  end
end
