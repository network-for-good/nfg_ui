require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/dropdowns/_dropdown_toggle.html.haml', type: :view do
  let(:dropdown_toggle) { FactoryBot.create(:bootstrap_dropdown_toggle, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/dropdowns/dropdown_toggle', dropdown_toggle: dropdown_toggle }

  describe 'html output for the bootstrap dropdown' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap dropdown component in html' do
      expect(subject).to have_css '.dropdown-toggle'
      expect(subject).to have_selector '.dropdown-toggle', text: body
      expect(subject).to eq "<button class=\"btn dropdown-toggle btn-primary\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\" type=\"button\">#{body}\n\n</button>"
    end

    context 'when the dropdown toggle is given a unique :as wrapper element' do
      let(:tested_element) { :blockquote }
      let(:options) { { body: body, as: tested_element } }
      it { is_expected.to have_selector "#{tested_element.to_s}.dropdown-toggle[data-toggle='dropdown']", text: body }
    end

    context 'when the dropdown toggle is given a theme' do
      let(:options) { { theme: :danger } }
      it { is_expected.to have_css ".dropdown-toggle.btn-danger" }
    end

    context 'and when the dropdown toggle is given additional html options' do
      let(:options) { { id: 'tested_id' } }
      it { is_expected.to have_css '#tested_id.dropdown-toggle' }
    end
  end
end