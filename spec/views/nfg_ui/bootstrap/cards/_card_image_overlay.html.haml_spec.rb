require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/cards/_card_image_overlay.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:card_image_overlay) { FactoryBot.create(:bootstrap_card_image_overlay, body: body) }
  subject { render 'nfg_ui/bootstrap/card_image_overlay', card_image_overlay: card_image_overlay }

  pending 'coming soon'

  it 'outputs a bootstrap card_image_overlay component in html' do
  end
end
