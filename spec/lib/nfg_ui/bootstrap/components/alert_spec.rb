require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Alert do
  let(:alert) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Dismissible utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Headable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Themeable utility module', component_suite: :bootstrap

  describe '#render' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }
    let(:rendered_html) { alert.render }
    subject { Capybara.string(rendered_html) }

    it 'outputs a bootstrap alert component in html' do
      expect(subject).to have_css '.alert'
      expect(subject).to have_css ".alert[role='alert']"
      expect(subject).to have_selector '.alert', text: body
      expect(rendered_html).to eq "<div class=\"alert alert-primary alert-dismissible fade show\" role=\"alert\"><button class=\"btn close\" data-dismiss=\"alert\" aria-label=\"Close\" type=\"button\"><span aria-hidden=\"true\">&times;</span></button>#{body}</div>"
    end

    describe 'alert with heading' do
      let(:tested_heading) { 'Tested Heading' }
      let(:options) { { heading: tested_heading } }
      it 'outputs an alert with an alert heading' do
        expect(subject).to have_css 'h4.alert-heading'
        expect(rendered_html).to include "<h4 class=\"alert-heading\">#{tested_heading}</h4>"
      end
    end

    describe 'themes on alerts' do
      context 'when a theme is supplied' do
        let(:options) { { theme: tested_theme } }
        let(:tested_theme) { NfgUi::BOOTSTRAP_THEMES.sample(1).first }
        it { is_expected.to have_css ".alert.alert-#{tested_theme}" }
      end

      context 'when a theme is not supplied' do
        let(:options) { {} }
        it { is_expected.to have_css '.alert.alert-primary' }
      end
    end

    describe 'dismissible alert' do
      context 'when the alert is dismissible' do
        let(:options) { { dismissible: true } }
        it 'shows the dismissible button' do
          expect(subject).to have_css 'button.close'
          expect(rendered_html).to include "<button class=\"btn close\" data-dismiss=\"alert\" aria-label=\"Close\" type=\"button\"><span aria-hidden=\"true\">&times;</span></button>"
        end
      end

      context 'when the alert is not dismissible' do
        let(:options) { { dismissible: false } }
        it { is_expected.not_to have_css 'button.close' }
      end

      context 'when alert dismissibility is not defined in options' do
        let(:options) { {} }
        it { is_expected.to have_css 'button.close' }
      end
    end
  end

  describe 'private themes' do
    describe '#assistive_html_attributes' do
      subject { alert.send(:assistive_html_attributes) }
      it { is_expected.to eq(role: 'alert') }
    end

    describe '#css_classes' do
      subject { alert.send(:css_classes) }
      context 'when dismissible' do
        let(:options) { { dismissible: true } }
        it { is_expected.to eq 'alert alert-primary alert-dismissible fade show' }
      end

      context 'when not dismissible' do
        let(:options) { { dismissible: false } }
        it { is_expected.to eq 'alert alert-primary' }
      end
    end

    describe '#outlineable?' do
      subject { alert.send(:outlineable?) }
      it { is_expected.not_to be }
    end
  end
end
