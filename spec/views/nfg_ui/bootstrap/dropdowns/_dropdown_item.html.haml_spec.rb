require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/dropdowns/_dropdown_item.html.haml', type: :view do
  let(:dropdown_item) { FactoryBot.create(:bootstrap_dropdown_item, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/dropdowns/dropdown_item', dropdown_item: dropdown_item }

  describe 'html output for the bootstrap dropdown item' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    context 'when no dropdown or disabled options are present' do
      it 'outputs a bootstrap dropdown component in html' do
        expect(subject).to have_css '.dropdown-item'
        expect(subject).to have_selector '.dropdown-item', text: body
        expect(subject).to eq "<a class=\"dropdown-item\">#{body}\n</a>"
      end
    end

    context 'when dropdown item has a tooltip and is disabled' do
      let(:tested_tooltip) { 'tested tooltip' }
      let(:options) { { body: body, tooltip: tested_tooltip, disabled: true  } }
      it 'outputs a unique dropdown item that accounts for disabled & tooltip needs' do
        expect(subject).to have_css "span.dropdown-item.disabled[data-toggle='tooltip'][title='#{tested_tooltip}'] a", text: body
        expect(subject).to eq "<span class='dropdown-item disabled' data-html='true' data-placement='top' data-toggle='tooltip' tabindex='0' title='tested tooltip'>\n<a style=\"pointer-events: none;\">test body content\n</a></span>\n" 
      end

    end
  end
end
