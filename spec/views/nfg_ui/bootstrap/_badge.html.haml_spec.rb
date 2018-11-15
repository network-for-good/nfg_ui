require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_badge.html.haml', type: :view do
  let(:badge) { FactoryBot.create(:bootstrap_badge, **options) }
  let(:options) { {} }
  let(:tested_href) { 'test_href' }
  subject { render 'nfg_ui/bootstrap/badge', badge: badge }

  describe 'html output for the bootstrap badge' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap badge component in html' do
      expect(subject).to have_css '.badge'
      expect(subject).to have_selector '.badge', text: body
      expect(subject).to eq "<span class=\"badge badge-primary\">#{body}\n</span>"
    end
  end

  describe 'custom wrapper html element for badges' do
    context 'when the badge is a link' do
      context 'when the badge has only an :href in the options' do
        let(:options) { { href: tested_href } }
        let(:tested_default_wrapper_element) { :an_element }
        before { badge.instance_variable_set(:@default_html_wrapper_element, tested_default_wrapper_element) }

        it 'outputs a badge as a link' do
          expect(subject).to have_css "a.badge[href='#{tested_href}']"
          expect(subject).not_to have_css "#{tested_default_wrapper_element}.badge"
          expect(subject).to eq "<a class=\"badge badge-primary\" href=\"#{tested_href}\">\n</a>"
        end
      end

      context 'when the badge has as: :a in the options' do
        let(:options) { { as: :a } }
        it { is_expected.to have_css "a.badge" }

        context 'when the badge has :href in the options' do
          let(:options) { { as: :a, href: tested_href } }
          it { is_expected.to have_css "a.badge[href='#{tested_href}']" }
        end

        context 'when the badge does not have :href in the options' do
          let(:options) { { as: :a } }
          it { is_expected.to have_css 'a.badge' }
          it { is_expected.not_to have_css 'a.badge[href]' }
        end
      end
    end
    context 'when the badge is not a link' do
      it 'outputs a linkless badge with the default wrapper element' do
        expect(subject).to have_css "span.badge"
        expect(subject).not_to have_css "a.badge"
        expect(subject).to eq "<span class=\"badge badge-primary\">\n</span>"
      end
    end
  end

  describe 'themes on badges' do
    context 'when a theme is supplied' do
      let(:options) { { theme: tested_theme } }
      let(:tested_theme) { NfgUi::BOOTSTRAP_THEMES.sample(1).first }
      it { is_expected.to have_css ".badge.badge-#{tested_theme}" }
    end

    context 'when a theme is not supplied' do
      let(:options) { {} }
      it { is_expected.to have_css '.badge.badge-primary' }
    end
  end

  describe 'Pill badges' do
    let(:options) { { pill: pill } }
    context 'when :pill is true' do
      let(:pill) { true }
      it 'has the correct modifier css class' do
        expect(subject).to have_css '.badge.badge-pill'
      end

      it 'does not add the :pill option as an html attribute' do
        expect(subject).not_to have_css '.badge[pill]'
      end
    end

    context 'when pill is false' do
      let(:pill) { false }
      it { is_expected.not_to have_css '.badge.badge-pill' }
      it { is_expected.to have_css '.badge' }
    end
  end
end
