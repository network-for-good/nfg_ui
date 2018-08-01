require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_badge.html.haml', type: :view do
  let(:button_group) { FactoryBot.create(:bootstrap_button_group, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/button_group', button_group: button_group }

  describe 'html output for the bootstrap button_group' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap button_group component in html' do
      expect(subject).to have_css '.btn-group'
      expect(subject).to have_selector '.btn-group', text: body
      expect(subject).to eq "<div class='btn-group' role='group'>\n#{body}\n</div>\n"
    end
  end
end
