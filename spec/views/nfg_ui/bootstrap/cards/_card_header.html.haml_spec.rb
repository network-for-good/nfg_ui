require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/cards/_card_header.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:card_header) { FactoryBot.create(:bootstrap_card_header, body: body) }
  subject { card_header.render }

  pending 'coming soon'

  it 'outputs a bootstrap card_header component in html' do
  end
end
