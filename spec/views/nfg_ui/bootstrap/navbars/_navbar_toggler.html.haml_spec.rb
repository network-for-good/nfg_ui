require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navbars/_navbar_toggler.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:navbar_toggler) { FactoryBot.create(:bootstrap_navbar_toggler, body: body, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/navbars/navbar_toggler', navbar_toggler: navbar_toggler }

  it 'outputs a bootstrap navbar component in html' do
    expect(subject).to have_selector '.navbar-toggler', text: body
    expect(subject).to eq "<div class='navbar-toggler'>\n#{body}\n</div>\n"
  end
end
