require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_pagination.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:pagination) { FactoryBot.create(:bootstrap_pagination, body: body) }
  subject { render 'nfg_ui/bootstrap/pagination', pagination: pagination }

  pending 'coming soon'

  it 'outputs a bootstrap pagination component in html' do
  end
end
