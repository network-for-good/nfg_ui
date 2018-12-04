require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/dropdowns/_dropdown_toggle.html.haml', type: :view do
  let(:dropdown_toggle) { FactoryBot.create(:bootstrap_dropdown_toggle, **options) }
  let(:options) { {} }
  subject { dropdown_toggle.render }

  describe 'html output for the bootstrap dropdown' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap dropdown component in html' do
      expect(subject).to have_css '.dropdown-toggle'
      expect(subject).to have_selector '.dropdown-toggle', text: body
      expect(subject).to eq "<button class=\"btn dropdown-toggle btn-primary\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\" type=\"button\">#{body}</button>"
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

    context 'and when a dropdown_toggle passes in nav_link' do
      let(:options) { { nav_link: true } }
      it { is_expected.not_to have_css '.btn' }
    end
  end

  describe 'resized dropdown toggle' do
    context 'when size is present in options' do
      let(:tested_size) { :lg }
      let(:options) { { size: tested_size } }
      it 'outputs a dropdown component with size html in place' do
        expect(subject).to have_css ".dropdown-toggle.btn-#{tested_size}"
        expect(subject).to eq "<button class=\"btn dropdown-toggle btn-#{tested_size} btn-primary\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\" type=\"button\"></button>"
      end
    end

    context 'when size is not present in options' do
      let(:options) { {} }
      it 'outputs a dropdown component with no size html in place' do
        expect(subject).to eq "<button class=\"btn dropdown-toggle btn-primary\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\" type=\"button\"></button>"
      end
    end

    context 'when size is not present in options' do
      let(:options) { { size: nil } }
      it 'outputs a dropdown component with no size html in place' do
        expect(subject).to eq "<button class=\"btn dropdown-toggle btn-primary\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\" type=\"button\"></button>"
      end
    end
  end
end
