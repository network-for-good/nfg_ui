require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navbars/_navbar.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:navbar) { FactoryBot.create(:bootstrap_navbar, body: body, **options) }
  let(:options) { {} }
  subject { navbar.render }

  it 'outputs a default bootstrap navbar component in html' do
    expect(subject).to have_selector '.navbar', text: body
    expect(subject).to eq "<nav class=\"navbar bg-light navbar-expand-lg navbar-light\">#{body}</nav>"
  end

  describe 'a custom wrapper element applied to the navbar' do
    context 'when a custom wrapper element is set via :as in the options' do
      let(:tested_element) { :div }
      let(:options) { { as: tested_element } }
      it 'applies the custom wrapper element and adds the navigation role' do
        expect(subject).to have_css "#{tested_element}.navbar[role='navigation']"
        expect(subject).to eq "<#{tested_element} class=\"navbar bg-light navbar-expand-lg navbar-light\" role=\"navigation\">#{body}</#{tested_element}>"
      end
    end

    context 'when a custom wrapper element is not set via :as in the options' do
      let(:options) { {} }
      it 'does not apply a navigation roll and utilizes the nav fallback element' do
        expect(subject).not_to have_css "navbar[role='navigation']"
        expect(subject).to eq "<nav class=\"navbar bg-light navbar-expand-lg navbar-light\">#{body}</nav>"
      end
    end
  end

  describe 'Navbar with navbar-expand output' do
    context 'when navbar expand is set to a custom value' do
      let(:tested_expand) { :sm }
      let(:options) { { expand: tested_expand } }
      it 'outputs a navbar with a custom expand option' do
        expect(subject).to have_css '.navbar-expand-sm'
        expect(subject).to eq "<nav class=\"navbar bg-light navbar-expand-#{tested_expand} navbar-light\">#{body}</nav>"
      end

      it 'does not utilize the default expand setting' do
        expect(subject).not_to have_css '.navbar-expand-lg'
      end
    end

    context 'when navbar expand is not set in options' do
      let(:options) { {} }
      it 'outputs a navbar with the default expand in html' do
        expect(subject).to have_css '.navbar-expand-lg'
        expect(subject).to eq "<nav class=\"navbar bg-light navbar-expand-lg navbar-light\">#{body}</nav>"
      end
    end

    context 'when navbar expand is set to nil' do
      let(:options) { { expand: nil } }
      it 'removes the navbar-expand-* class from the component html' do
        expect(subject).not_to have_css "[class*='navbar-expand']"
        expect(subject).to eq "<nav class=\"navbar bg-light navbar-light\">#{body}</nav>"
      end
    end
  end

  describe 'navbar thematics' do
    context 'when no theme is supplied' do
      let(:options) { {} }
      it { is_expected.to have_css '.bg-light.navbar-light' }
    end

    context 'when supplying a custom dark theme' do
      let(:dark_themes) { NfgUi::Bootstrap::Components::Navbar.new({}, ActionController::Base.new.view_context).send(:dark_themes) }
      let(:options) { { theme: tested_theme } }

      context 'when primary' do
        let(:tested_theme) { :primary }
        it { is_expected.to have_css '.bg-primary.navbar-dark' }
        it { is_expected.not_to have_css '.navbar-light' }
      end

      context 'when secondary' do
        let(:tested_theme) { :secondary }
        it { is_expected.to have_css '.bg-secondary.navbar-dark' }
        it { is_expected.not_to have_css '.navbar-light' }
      end

      context 'when success' do
        let(:tested_theme) { :success }
        it { is_expected.to have_css '.bg-success.navbar-dark' }
        it { is_expected.not_to have_css '.navbar-light' }
      end

      context 'when danger' do
        let(:tested_theme) { :danger }
        it { is_expected.to have_css '.bg-danger.navbar-dark' }
        it { is_expected.not_to have_css '.navbar-light' }
      end

      context 'when warning' do
        let(:tested_theme) { :warning }
        it { is_expected.to have_css '.bg-warning.navbar-dark' }
        it { is_expected.not_to have_css '.navbar-light' }
      end

      context 'when info' do
        let(:tested_theme) { :info }
        it { is_expected.to have_css '.bg-info.navbar-dark' }
        it { is_expected.not_to have_css '.navbar-light' }
      end

      context 'when dark' do
        let(:tested_theme) { :dark }
        it { is_expected.to have_css '.bg-dark.navbar-dark' }
        it { is_expected.not_to have_css '.navbar-light' }
      end

      context 'when light' do
        let(:tested_theme) { :light }
        it { is_expected.to have_css '.bg-light.navbar-light' }
        it { is_expected.not_to have_css '.navbar-dark' }
      end
    end
  end

  describe 'navbar fixed position' do
    subject {  }
  end
end
