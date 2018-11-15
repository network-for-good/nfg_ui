require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/cards/_card.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:card) { FactoryBot.create(:bootstrap_card, body: body) }
  subject { render 'nfg_ui/bootstrap/card', card: card }

  pending 'coming soon'

  it 'outputs a bootstrap card component in html' do
  end
end
