require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_table.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:table) { FactoryBot.create(:bootstrap_table, body: body) }
  subject { render 'nfg_ui/bootstrap/table', table: table }

  pending 'coming soon'

  it 'outputs a bootstrap table component in html' do
  end
end
