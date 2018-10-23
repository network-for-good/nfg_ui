require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navbars/_navbar_toggler.html.haml', type: :view do
  let(:body) { nil }
  let(:navbar_toggler) { FactoryBot.create(:bootstrap_navbar_toggler, body: body, **options) }
  let(:options) { { collapse: '#test' } }
  subject { render 'nfg_ui/bootstrap/navbars/navbar_toggler', navbar_toggler: navbar_toggler }

  it 'outputs a bootstrap navbar component in html' do
    expect(subject).to eq "<button aria-controls='test' aria-expanded='false' class='navbar-toggler' data-target='#test' data-toggle='collapse' role='button'>\n<span class='navbar-toggler-icon'></span>\n</button>\n"
  end

  context 'when adding a custom :body to the toggler' do
    let(:tested_body) { 'Tested body' }
    let(:options) { { body: tested_body, collapse: '#test' } }

    it 'adds the supplied body' do
      expect(subject).to eq "<button aria-controls='test' aria-expanded='false' class='navbar-toggler' data-target='#test' data-toggle='collapse' role='button'>\n#{tested_body}\n</button>\n"
    end

    it 'does not supply the toggler icon' do
      expect(subject).not_to have_css '.navbar-toggler-icon'
    end
  end
end
