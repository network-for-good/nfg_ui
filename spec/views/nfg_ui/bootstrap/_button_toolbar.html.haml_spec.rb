require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_button_toolbar.html.haml', type: :view do
  let(:button_toolbar) { FactoryBot.create(:bootstrap_button_toolbar, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/button_toolbar', button_toolbar: button_toolbar }

  describe 'html output for the bootstrap button_toolbar' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap button_toolbar component in html' do
      expect(subject).to have_css '.btn-toolbar'
      expect(subject).to have_selector '.btn-toolbar', text: body
      expect(subject).to eq "<div class='btn-toolbar' role='toolbar'>\n#{body}\n</div>\n"
    end
  end
end
