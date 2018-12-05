require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/dropdowns/_dropdown_header.html.haml', type: :view do
  let(:dropdown_header) { FactoryBot.create(:bootstrap_dropdown_header, **options) }
  let(:options) { {} }
  subject { dropdown_header.render }

  describe 'html output for the bootstrap dropdown header' do
    let(:options) { { heading: tested_heading } }
    let(:tested_heading) { 'tested heading' }

    it 'outputs a bootstrap dropdown component in html' do
      expect(subject).to have_css 'h6.dropdown-header'
      expect(subject).to have_selector 'h6.dropdown-header', text: tested_heading
      expect(subject).to eq "<h6 class=\"dropdown-header\">#{tested_heading}</h6>"
    end
  end
end
