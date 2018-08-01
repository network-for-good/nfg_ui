require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_alert.html.haml', type: :view do
  let(:alert) { FactoryBot.create(:bootstrap_alert, **options) }
  let(:options) { { body: body } }
  let(:body) { 'test body content' }
  subject { render 'nfg_ui/bootstrap/alert', alert: alert }

  it 'outputs a bootstrap alert component in html' do
    expect(subject).to have_css '.alert'
    expect(subject).to have_css ".alert[role='alert']"
    expect(subject).to have_selector '.alert', text: body
    expect(subject).to eq "<div class='alert alert-primary' role='alert'>\n<button aria-label='Close' as='button' class='button close' data-dismiss='alert'>\n<span aria-hidden='true'>\n&times;\n</span>\n\n</button>\n#{body}\n</div>\n"
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
        expect(subject).to include "<button aria-label='Close' as='button' class='button close' data-dismiss='alert'>\n<span aria-hidden='true'>\n&times;\n</span>"
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
