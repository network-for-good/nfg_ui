require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navs/_nav_item.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:nav_item) { FactoryBot.create(:bootstrap_nav_item, body: body) }
  subject { render 'nfg_ui/bootstrap/navs/nav_item', nav_item: nav_item }

  it 'outputs a bootstrap nav item component in html' do
    expect(subject).to have_selector 'li.nav-item a.nav-link', text: body
    expect(subject).to eq "<li class='nav-item'><a class='nav-link'>\n#{body}\n</a></li>\n"
  end
end
