require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/dropdowns/_dropdown_item.html.haml', type: :view do
  let(:dropdown_item) { FactoryBot.create(:bootstrap_dropdown_item, **options) }
  let(:options) { {} }
  subject { dropdown_item.render }

  describe 'html output for the bootstrap dropdown item' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    context 'when no dropdown or disabled options are present' do
      it 'outputs a bootstrap dropdown component in html' do
        expect(subject).to have_css '.dropdown-item'
        expect(subject).to have_selector '.dropdown-item', text: body
        expect(subject).to eq "<a class=\"dropdown-item\">#{body}</a>"
      end
    end

    context 'when dropdown item has a tooltip and is disabled' do
      let(:tested_tooltip) { 'tested tooltip' }
      let(:options) { { body: body, tooltip: tested_tooltip, disabled: true  } }
      it 'outputs a unique dropdown item that accounts for disabled & tooltip needs' do
        expect(subject).to have_css "span[data-toggle='tooltip'][tabindex='0'] .dropdown-item.disabled[tabindex='-1']", text: body
        expect(subject).to eq "<span data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"#{tested_tooltip}\" class=\"d-inline-block\" tabindex=\"0\"><a class=\"dropdown-item disabled\" tabindex=\"-1\" style=\"pointer-events: none;\">#{body}</a></span>"
      end
    end
  end
end
