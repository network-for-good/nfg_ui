require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navbars/_navbar_toggler.html.haml', type: :view do
  let(:tested_body) { nil }
  let(:body) { tested_body }
  let(:navbar_toggler) { FactoryBot.create(:bootstrap_navbar_toggler, body: body, **options) }
  let(:tested_collapse_word) { 'test' }
  let(:tested_collapse) { "##{tested_collapse_word}" }
  let(:options) { { collapse: tested_collapse, body: tested_body } }
  subject { navbar_toggler.render }

  it 'outputs a bootstrap navbar component in html' do
    expect(subject).to eq "<button class=\"navbar-toggler\" data-toggle=\"collapse\" data-target=\"#test\" aria-expanded=\"false\" aria-controls=\"test\" role=\"button\"><span class=\"navbar-toggler-icon\"></span></button>"
  end

  context 'when adding a custom :body to the toggler' do
    let(:tested_body) { 'Tested body' }

    it 'adds the supplied body' do
      expect(subject).to eq "<button class=\"navbar-toggler\" data-toggle=\"collapse\" data-target=\"#test\" aria-expanded=\"false\" aria-controls=\"test\" role=\"button\">#{tested_body}</button>"
    end

    it 'does not supply the toggler icon' do
      expect(subject).not_to have_css '.navbar-toggler-icon'
    end
  end
end
