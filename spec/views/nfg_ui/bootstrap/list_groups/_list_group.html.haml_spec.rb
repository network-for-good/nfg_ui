require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/list_groups/_list_group.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:list_group) { FactoryBot.create(:bootstrap_list_group, body: body) }
  subject { render 'nfg_ui/bootstrap/list_groups/list_group', list_group: list_group }

  pending 'coming soon'

  it 'outputs a bootstrap list_group component in html' do
  end
end
