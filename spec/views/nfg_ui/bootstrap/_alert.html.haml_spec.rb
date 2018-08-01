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
    expect(subject).to eq "<div class='alert alert-primary' role='alert'>\n#{body}\n</div>\n"
  end

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
