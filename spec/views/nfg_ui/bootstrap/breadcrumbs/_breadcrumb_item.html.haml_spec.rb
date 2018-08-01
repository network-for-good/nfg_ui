require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/breadcrumbs/_breadcrumb_item.html.haml', type: :view do
  let(:breadcrumb_item) { FactoryBot.create(:bootstrap_breadcrumb_item, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/breadcrumbs/breadcrumb_item', breadcrumb_item: breadcrumb_item }

  describe 'html output for the bootstrap badge' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap breadcrumb component in html' do
      expect(subject).to have_css "li.breadcrumb-item"
      expect(subject).to have_selector 'li.breadcrumb-item', text: body
      expect(subject).to eq "<li class='breadcrumb-item'>\n#{body}\n</li>\n"
    end
  end
end
