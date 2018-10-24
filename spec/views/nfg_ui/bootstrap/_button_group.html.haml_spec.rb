require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_button_group.html.haml', type: :view do
  let(:button_group) { FactoryBot.create(:bootstrap_button_group, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/button_group', button_group: button_group }

  describe 'html output for the bootstrap button_group' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap button_group component in html' do
      expect(subject).to have_css '.btn-group'
      expect(subject).to have_selector '.btn-group', text: body
      expect(subject).to eq "<div aria-label='action buttons' class='btn-group' role='group'>\n#{body}\n</div>\n"
    end
  end

  describe 'dropdown menu directions when acting as a container for a dropdown menu' do
    describe 'dropdown menu with dropleft direction' do
      context 'when dropleft is true in options' do
        let(:options) { { dropleft: true } }
        
        it 'outputs a dropdown component with dropleft html in place' do
          expect(subject).to have_css '.btn-group.dropleft'
          expect(subject).to eq "<div aria-label='action buttons' class='btn-group dropleft' role='group'>\n\n</div>\n"
        end
      end

      context 'when dropleft is false in options' do
        let(:options) { { dropleft: false } }
        it 'outputs a dropdown component without dropleft html in place' do
          expect(subject).not_to have_css '.btn-group.dropleft'
          expect(subject).to have_css '.btn-group'
          expect(subject).to eq "<div aria-label='action buttons' class='btn-group' role='group'>\n\n</div>\n"
        end
      end

      context 'when dropleft is not present in options' do
        let(:options) { {} }
        it { is_expected.not_to have_css '.btn-group.dropleft' }
        it { is_expected.to have_css '.btn-group' }
      end
    end

    describe 'dropdown menu with dropright direction' do
      context 'when dropright is true in options' do
        let(:options) { { dropright: true } }
        it 'outputs a dropdown component with dropright html in place' do
          expect(subject).to have_css '.btn-group.dropright'
          expect(subject).to eq "<div aria-label='action buttons' class='btn-group dropright' role='group'>\n\n</div>\n"
        end
      end

      context 'when dropright is false in options' do
        let(:options) { { dropright: false } }
        it 'outputs a dropdown component without dropright html in place' do
          expect(subject).not_to have_css '.btn-group.dropright'
          expect(subject).to have_css '.btn-group'
          expect(subject).to eq "<div aria-label='action buttons' class='btn-group' role='group'>\n\n</div>\n"
        end
      end

      context 'when dropright is not present in options' do
        let(:options) { {} }
        it { is_expected.not_to have_css '.btn-group.dropright' }
        it { is_expected.to have_css '.btn-group' }
      end
    end

    describe 'dropdown menu with dropup direction' do
      context 'when dropup is true in options' do
        let(:options) { { dropup: true } }
        it 'outputs a dropdown component with dropup html in place' do
          expect(subject).to have_css '.btn-group.dropup'
          expect(subject).to eq "<div aria-label='action buttons' class='btn-group dropup' role='group'>\n\n</div>\n"
        end
      end

      context 'when dropup is false in options' do
        let(:options) { { dropup: false } }
        it 'outputs a dropdown component without dropup html in place' do
          expect(subject).not_to have_css '.btn-group.dropup'
          expect(subject).to have_css '.btn-group'
          expect(subject).to eq "<div aria-label='action buttons' class='btn-group' role='group'>\n\n</div>\n"
        end
      end

      context 'when dropup is not present in options' do
        let(:options) { {} }
        it { is_expected.not_to have_css '.btn-group.dropup' }
        it { is_expected.to have_css '.btn-group' }
      end
    end
  end
end
