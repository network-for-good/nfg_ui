require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/cards/_card_footer.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:card_footer) { FactoryBot.create(:bootstrap_card_footer, body: body) }
  subject { card_footer.render }

  pending 'coming soon'

  it 'outputs a bootstrap card_footer component in html' do
  end
end
