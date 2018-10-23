require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navbars/_navbar_text.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:navbar_text) { FactoryBot.create(:bootstrap_navbar_text, body: body, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/navbars/navbar_text', navbar_text: navbar_text }

  it 'outputs a bootstrap navbar component in html' do
    expect(subject).to have_selector '.navbar-text', text: body
    expect(subject).to eq "<div class='navbar-text'>\n#{body}\n</div>\n"
  end
end
