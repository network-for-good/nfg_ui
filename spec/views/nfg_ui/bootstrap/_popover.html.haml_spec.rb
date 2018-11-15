require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_popover.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:popover) { FactoryBot.create(:bootstrap_popover, body: body) }
  subject { render 'nfg_ui/bootstrap/popover', popover: popover }

  it 'outputs a bootstrap popover component in html' do
    expect(subject).to have_selector '.popover', text: body
    expect(subject).to eq "<div class='popover'>\n#{body}\n</div>\n"
  end
end
