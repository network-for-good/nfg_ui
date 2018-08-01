require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_jumbotron.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:jumbotron) { FactoryBot.create(:bootstrap_jumbotron, body: body) }
  subject { render 'nfg_ui/bootstrap/jumbotron', jumbotron: jumbotron }

  pending 'coming soon'

  it 'outputs a bootstrap jumbotron component in html' do
  end
end
