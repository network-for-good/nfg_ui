require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_pagination.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:pagination) { FactoryBot.create(:bootstrap_pagination, body: body) }
  subject { render 'nfg_ui/bootstrap/pagination', pagination: pagination }

  it 'outputs a bootstrap pagination component in html' do
    expect(subject).to have_selector '.pagination', text: body
    expect(subject).to eq "<div class='pagination'>\n#{body}\n</div>\n"
  end
end
