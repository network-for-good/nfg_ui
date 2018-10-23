require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navbars/_navbar_brand.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:navbar_brand) { FactoryBot.create(:bootstrap_navbar_brand, body: body, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/navbars/navbar_brand', navbar_brand: navbar_brand }

  it 'outputs a bootstrap navbar component in html' do
    expect(subject).to have_selector '.navbar-brand', text: body
    expect(subject).to eq "<a class='navbar-brand' href='javascript:;'>\n#{body}\n</a>\n"
  end
end
