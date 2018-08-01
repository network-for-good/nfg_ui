require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_navbar.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:navbar) { FactoryBot.create(:bootstrap_navbar, body: body) }
  subject { render 'nfg_ui/bootstrap/navbar', navbar: navbar }

  pending 'coming soon'

  it 'outputs a bootstrap navbar component in html' do
  end
end
