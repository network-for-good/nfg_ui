require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/cards/_card_footer.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:card_footer) { FactoryBot.create(:bootstrap_card_footer, body: body) }
  subject { render 'nfg_ui/bootstrap/card_footer', card_footer: card_footer }

  pending 'coming soon'

  it 'outputs a bootstrap card_footer component in html' do
  end
end
