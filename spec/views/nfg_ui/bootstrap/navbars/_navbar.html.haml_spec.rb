require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navbars/_navbar.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:navbar) { FactoryBot.create(:bootstrap_navbar, body: body, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/navbars/navbar', navbar: navbar }

  it 'outputs a default bootstrap navbar component in html' do
    expect(subject).to have_selector '.navbar', text: body
    expect(subject).to eq "<div class='navbar bg-light navbar-expand-lg navbar-light'>\n#{body}\n</div>\n"
  end
end
