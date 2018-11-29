require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/dropdowns/_dropdown.html.haml', type: :view do
  let(:dropdown) { FactoryBot.create(:bootstrap_dropdown, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/dropdowns/dropdown', dropdown: dropdown }

  describe 'html output for the bootstrap dropdown' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    context 'when the dropdown button is not present in options' do
      it 'outputs a bootstrap dropdown component in html' do
        expect(subject).to have_css '.dropdown'
        expect(subject).to have_selector '.dropdown', text: body
        expect(subject).to eq "<div class='dropdown'>\n#{body}\n</div>\n"
      end
    end

    context 'when the dropdown button is present in options' do
      let(:button_text) { 'dropdown toggle' }
      let(:options) { { body: body, button: button_text, **toggle_options } }
      let(:toggle_options) { {} }
      context 'and when only button text is present in options' do
        it 'adds a dropdown toggle button to the component in HTML' do
          expect(subject).to have_css '.btn.dropdown-toggle.btn-primary'
          expect(subject).to eq "<div class='dropdown'>\n<button class=\"btn dropdown-toggle btn-primary\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\" type=\"button\">#{button_text}\n</button>\n#{body}\n</div>\n"
        end
      end

      context 'and when the button has a theme' do
        let(:toggle_options) { { theme: :danger } }
        it { is_expected.to have_css '.btn.dropdown-toggle.btn-danger' }
      end

      context 'and when the button has an offset' do
        let(:tested_offset) { '10,20' }
        let(:toggle_options) { { offset: tested_offset } }
        it { is_expected.to have_css ".btn.dropdown-toggle[data-offset='#{tested_offset}']" }
      end
    end
  end

  describe 'dropdown menu directions' do
    describe 'dropdown menu with dropleft direction' do
      context 'when dropleft is true in options' do
        let(:options) { { dropleft: true } }
        it 'outputs a dropdown component with dropleft html in place' do
          expect(subject).to have_css '.dropdown.dropleft'
          expect(subject).to eq "<div class='dropdown dropleft'>\n\n</div>\n"
        end
      end

      context 'when dropleft is false in options' do
        let(:options) { { dropleft: false } }
        it 'outputs a dropdown component without dropleft html in place' do
          expect(subject).not_to have_css '.dropdown.dropleft'
          expect(subject).to have_css '.dropdown'
          expect(subject).to eq "<div class='dropdown'>\n\n</div>\n"
        end
      end

      context 'when dropleft is not present in options' do
        let(:options) { {} }
        it { is_expected.not_to have_css '.dropdown.dropleft' }
        it { is_expected.to have_css '.dropdown' }
      end
    end

    describe 'dropdown menu with dropright direction' do
      context 'when dropright is true in options' do
        let(:options) { { dropright: true } }
        it 'outputs a dropdown component with dropright html in place' do
          expect(subject).to have_css '.dropdown.dropright'
          expect(subject).to eq "<div class='dropdown dropright'>\n\n</div>\n"
        end
      end

      context 'when dropright is false in options' do
        let(:options) { { dropright: false } }
        it 'outputs a dropdown component without dropright html in place' do
          expect(subject).not_to have_css '.dropdown.dropright'
          expect(subject).to have_css '.dropdown'
          expect(subject).to eq "<div class='dropdown'>\n\n</div>\n"
        end
      end

      context 'when dropright is not present in options' do
        let(:options) { {} }
        it { is_expected.not_to have_css '.dropdown.dropright' }
        it { is_expected.to have_css '.dropdown' }
      end
    end

    describe 'dropdown menu with dropup direction' do
      context 'when dropup is true in options' do
        let(:options) { { dropup: true } }
        it 'outputs a dropdown component with dropup html in place' do
          expect(subject).to have_css '.dropdown.dropup'
          expect(subject).to eq "<div class='dropdown dropup'>\n\n</div>\n"
        end
      end

      context 'when dropup is false in options' do
        let(:options) { { dropup: false } }
        it 'outputs a dropdown component without dropup html in place' do
          expect(subject).not_to have_css '.dropdown.dropup'
          expect(subject).to have_css '.dropdown'
          expect(subject).to eq "<div class='dropdown'>\n\n</div>\n"
        end
      end

      context 'when dropup is not present in options' do
        let(:options) { {} }
        it { is_expected.not_to have_css '.dropdown.dropup' }
        it { is_expected.to have_css '.dropdown' }
      end
    end
  end
end
