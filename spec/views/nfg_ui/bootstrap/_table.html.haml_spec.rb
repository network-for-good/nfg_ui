require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_table.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:table) { FactoryBot.create(:bootstrap_table, body: body) }
  subject { render 'nfg_ui/bootstrap/table', table: table }

  it 'outputs a bootstrap table component in html' do
    expect(subject).to have_selector '.table', text: body
    expect(subject).to eq "<table class='table'>\n#{body}\n</table>\n"
  end
end
