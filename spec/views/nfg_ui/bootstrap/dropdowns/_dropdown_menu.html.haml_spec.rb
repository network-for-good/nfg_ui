require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/dropdowns/_dropdown_menu.html.haml', type: :view do
  let(:dropdown_menu) { FactoryBot.create(:bootstrap_dropdown_menu, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/dropdowns/dropdown_menu', dropdown_menu: dropdown_menu }

  describe 'html output for the bootstrap dropdown' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap dropdown component in html' do
      expect(subject).to have_css '.dropdown-menu'
      expect(subject).to have_selector '.dropdown-menu', text: body
      expect(subject).to eq "<div class='dropdown-menu'>\n#{body}\n</div>\n"
    end
  end
end
