require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navbars/_navbar_nav.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:navbar_nav) { FactoryBot.create(:bootstrap_navbar_nav, body: body, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/navbars/navbar_nav', navbar_nav: navbar_nav }

  it 'outputs a bootstrap navbar component in html' do
    expect(subject).to have_selector '.navbar-nav', text: body
    expect(subject).to eq "<div class='navbar-nav'>\n#{body}\n</div>\n"
  end
end
