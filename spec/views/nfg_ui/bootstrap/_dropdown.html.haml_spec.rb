require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_dropdown.html.haml', type: :view do
  let(:dropdown) { FactoryBot.create(:bootstrap_dropdown, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/dropdown', dropdown: dropdown }

  describe 'html output for the bootstrap dropdown' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap dropdown component in html' do
      expect(subject).to have_css '.dropdown'
      expect(subject).to have_selector '.dropdown', text: body
      expect(subject).to eq "<div class='dropdown'>\n#{body}\n</div>\n"
    end
  end
end
