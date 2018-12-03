require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_input_group.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:input_group) { FactoryBot.create(:bootstrap_input_group, body: body) }
  subject { input_group.render }

  it 'outputs a bootstrap input_group component in html' do
    expect(subject).to have_css '.input-group'
    expect(subject).to have_selector '.input-group', text: body
    expect(subject).to eq "<div class=\"input-group\">#{body}</div>"
  end
end
