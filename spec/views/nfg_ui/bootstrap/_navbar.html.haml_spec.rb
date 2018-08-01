require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_navbar.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:navbar) { FactoryBot.create(:bootstrap_navbar, body: body) }
  subject { render 'nfg_ui/bootstrap/navbar', navbar: navbar }

  it 'outputs a bootstrap navbar component in html' do
    expect(subject).to have_selector '.navbar', text: body
    expect(subject).to eq "<div class='navbar'>\n#{body}\n</div>\n"
  end
end
