require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/tabs/_tab_content.html.haml', type: :view do
  let(:tab_content) { FactoryBot.create(:bootstrap_tab_content, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/tabs/tab_content', tab_content: tab_content }

  describe 'html output for the bootstrap tab_content' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap tab_content component in html' do
      expect(subject).to have_selector '.tab-content', text: body
      expect(subject).to eq "<div class='tab-content'>\n#{body}\n</div>\n"
    end
  end
end
