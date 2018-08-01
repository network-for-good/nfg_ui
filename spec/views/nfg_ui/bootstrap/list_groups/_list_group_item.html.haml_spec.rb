require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/list_groups/_list_group_item.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:list_group_item) { FactoryBot.create(:bootstrap_list_group_item, body: body) }
  subject { render 'nfg_ui/bootstrap/list_group_item', list_group_item: list_group_item }

  pending 'coming soon'

  it 'outputs a bootstrap list_group_item component in html' do
  end
end
