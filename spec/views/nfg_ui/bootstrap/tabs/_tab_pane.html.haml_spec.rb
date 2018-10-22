require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/tabs/_tab_pane.html.haml', type: :view do
  let(:tab_pane) { FactoryBot.create(:bootstrap_tab_pane, **options, body: body) }
  let(:options) { {} }
  let(:body) { 'test body pane' }
  subject { render 'nfg_ui/bootstrap/tabs/tab_pane', tab_pane: tab_pane }

  describe 'html output for the bootstrap tab_pane' do
    let(:options) { {} }
    it 'outputs a default bootstrap tab_pane component in html' do
      expect(subject).to have_selector '.tab-pane.fade', text: body
      expect(subject).to eq "<div class='tab-pane fade' role='tabpanel'>\n#{body}\n</div>\n"
    end
  end

  describe "the tab_pane's html ID" do
    let(:options) { {} }

    context 'when :tab is supplied in options' do
      let(:tested_tab) { '#test_tab' }
      let(:options) { { tab: tested_tab } }
      it 'utilizes the tab attribute for the ID' do
        expect(subject).to have_css '.tab-pane[id]'
        expect(subject).to have_css "#{tested_tab}.tab-pane"
        expect(subject).to eq "<div class='tab-pane fade' id='#{tested_tab.tr('#', '')}' role='tabpanel'>\n#{body}\n</div>\n"
      end
    end

    context 'when :tab is not supplied in options' do
      let(:options) { {} }
      context 'when :id is not supplied in options' do
        let(:options) { {} }
        it 'does not implement an html ID' do
          expect(subject).not_to have_css '.tab-pane[id]'
        end
      end
      context 'when :id is supplied in options' do
        let(:tested_id) { 'tested_id' }
        let(:options) { {id: tested_id } }
        it 'adds an html ID' do
          expect(subject).to have_css "##{tested_id}.tab-pane"
        end
      end
    end
  end

  describe 'tab_pane with fade attributes' do
    

    context 'when fade is true for the tab_pane' do
      let(:options) { { fade: true } }
      it 'utilizes the fade css class' do
        expect(subject).to have_css '.tab-pane.fade'
      end
    end

    context 'when fade is false for the tab pane' do
      let(:options) { { fade: false } }
      it 'does not utilize the fade css class' do
        expect(subject).not_to have_css '.tab-pane.fade'
        expect(subject).to have_css '.tab-pane'
      end
    end

    context 'when fade is not set in options' do
      let(:options) { {} }
      it 'utilizes the fade css class by default' do
        expect(subject).to have_css '.tab-pane.fade'
      end
    end
  end

  describe 'an activated tab pane' do
    context 'when the tab pane is set active' do
      let(:options) { { active: true } }
      it 'activates and shows the tab pane' do
        expect(subject).to have_css '.tab-pane.active.show'
        expect(subject).to eq "<div class='tab-pane active fade show' role='tabpanel'>\n#{body}\n</div>\n"
      end
    end

    context 'when the tab pane is not set to false' do
      let(:options) { { active: false } }
      it 'does not activate the tab pane' do
        expect(subject).not_to have_css '.tab-pane.active.show'
        expect(subject).to have_css '.tab-pane'
      end
    end
  end
end
