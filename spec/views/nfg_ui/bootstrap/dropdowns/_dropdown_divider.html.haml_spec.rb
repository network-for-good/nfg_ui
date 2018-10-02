require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/dropdowns/_dropdown_divider.html.haml', type: :view do
  let(:dropdown_divider) { FactoryBot.create(:bootstrap_dropdown_divider, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/dropdowns/dropdown_divider', dropdown_divider: dropdown_divider }

  describe 'html output for the bootstrap dropdown divider' do
    let(:options) { { id: tested_id } }
    let(:tested_id) { 'test_id' }

    it 'outputs a bootstrap dropdown component in html' do
      expect(subject).to have_css '.dropdown-divider'
      expect(subject).to eq "<div class='dropdown-divider' id='#{tested_id}'></div>\n"
    end
  end
end
