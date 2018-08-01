require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_input_group.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:input_group) { FactoryBot.create(:bootstrap_input_group, body: body) }
  subject { render 'nfg_ui/bootstrap/input_group', input_group: input_group }

  pending 'coming soon'

  it 'outputs a bootstrap input_group component in html' do
  end
end
