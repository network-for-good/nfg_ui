require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Badge do
  let(:badge) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { { pill: pill_presence } }
  let(:pill_presence) { nil }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Themeable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Wrappable utility module', component_suite: :bootstrap

  describe '#pill' do
    context 'when pill is true' do
      let(:pill_presence) { true }
      it { expect(badge.options[:pill]).to be }
    end

    context 'when pill is false' do
      let(:pill_presence) { false }
      it { expect(badge.options[:pill]).to be false }
    end

    context 'when pill is not present' do
      let(:pill_presence) { nil }
      it { expect(badge.options[:pill]).to be_falsey }
    end
  end

  describe '#render' do
    let(:tested_href) { 'test_href' }
    let(:rendered_html) { badge.render }
    subject { Capybara.string(rendered_html) }

    describe 'html output for the bootstrap badge' do
      let(:options) { { body: body } }
      let(:body) { 'test body content' }

      it 'outputs a bootstrap badge component in html' do
        expect(subject).to have_css '.badge'
        expect(subject).to have_selector '.badge', text: body
        expect(rendered_html).to eq "<span class=\"badge badge-primary\">#{body}</span>"
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
            expect(rendered_html).to eq "<a class=\"badge badge-primary\" href=\"#{tested_href}\"></a>"
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
          expect(rendered_html).to eq "<span class=\"badge badge-primary\"></span>"
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

  describe 'private methods' do
    describe '#css_classes' do
      subject { badge.send(:css_classes) }

      context 'when pill is true' do
        let(:pill_presence) { true }
        it { is_expected.to eq 'badge badge-primary badge-pill' }
      end

      context 'when pill is determined false' do
        let(:pill_presence) { false }
        it { is_expected.not_to include 'badge-pill' }
      end
    end

    describe '#default_html_wrapper_element' do
      subject { badge.send(:default_html_wrapper_element) }
      it { is_expected.to eq :span }
    end

    describe '#non_html_attribute_options' do
      subject { badge.send(:non_html_attribute_options) }
      it { is_expected.to include(:pill) }
    end
  end
end
