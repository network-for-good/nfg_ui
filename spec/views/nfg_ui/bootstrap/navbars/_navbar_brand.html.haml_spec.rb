require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navbars/_navbar_brand.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:navbar_brand) { FactoryBot.create(:bootstrap_navbar_brand, body: body, **options) }
  let(:options) { {} }
  subject { navbar_brand.render }

  it 'outputs a bootstrap navbar component in html' do
    expect(subject).to have_selector '.navbar-brand', text: body
    expect(subject).to eq "<a class=\"navbar-brand\" href=\"#\">#{body}</a>"
  end
end
