require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navs/_nav_link.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:nav_link) { FactoryBot.create(:bootstrap_nav_link, body: body) }
  subject { render 'nfg_ui/bootstrap/navs/nav_link', nav_link: nav_link }

  it 'outputs a bootstrap nav link component in html' do
    expect(subject).to have_selector 'a.nav-link', text: body
    expect(subject).to eq "<a class='nav-link'>\n#{body}\n</a>\n"
  end
end
