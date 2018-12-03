require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_jumbotron.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:jumbotron) { FactoryBot.create(:bootstrap_jumbotron, body: body) }
  subject { jumbotron.render }

  it 'outputs a bootstrap jumbotron component in html' do
    expect(subject).to have_css '.jumbotron'
    expect(subject).to have_selector '.jumbotron', text: body
    expect(subject).to eq "<div class=\"jumbotron\">#{body}</div>"
  end
end
