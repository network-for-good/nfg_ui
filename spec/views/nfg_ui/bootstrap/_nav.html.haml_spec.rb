require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_nav.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:nav) { FactoryBot.create(:bootstrap_nav, body: body) }
  subject { render 'nfg_ui/bootstrap/nav', nav: nav }

  it 'outputs a bootstrap nav component in html' do
    expect(subject).to have_selector '.nav', text: body
    expect(subject).to eq "<div class='nav'>\n#{body}\n</div>\n"
  end
end
