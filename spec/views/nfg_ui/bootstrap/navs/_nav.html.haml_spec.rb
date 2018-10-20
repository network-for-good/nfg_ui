require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navs/_nav.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:nav) { FactoryBot.create(:bootstrap_nav, body: body) }
  subject { render 'nfg_ui/bootstrap/navs/nav', nav: nav }

  it 'outputs a bootstrap nav component in html' do
    expect(subject).to have_selector 'ul.nav', text: body
    expect(subject).to eq "<ul class='nav'>\n#{body}\n</ul>\n"
  end
end
