require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/list_groups/_list_group_item.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:list_group_item) { FactoryBot.create(:bootstrap_list_group_item, *options, body: body) }
  let(:options) { {} }

  subject { render 'nfg_ui/bootstrap/list_groups/list_group_item', list_group_item: list_group_item }

  describe 'a standard list-group-item with no additional options' do
    let(:options) { {} }
  end

  describe 'a disabled list-group-item' do
    let(:options) { { disabled: true } }
  end

  describe 'a thematic list-group-item' do
    let(:options) { { disabled: true } }
  end

  describe 'an action list-group-item' do
    let(:options) { { disabled: true } }
  end

  describe 'an active list-group-item' do
    let(:options) { { disabled: true } }
  end

  describe 'a custom element (:as) list-group-item' do
    let(:options) { { disabled: true } }
  end
end
