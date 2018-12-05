require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/cards/_card_image.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:card_image) { FactoryBot.create(:bootstrap_card_image, body: body) }
  subject { card_image.render }

  pending 'coming soon'

  it 'outputs a bootstrap card_image component in html' do
  end
end
