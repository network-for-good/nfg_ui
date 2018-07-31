require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_alert.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:alert) { FactoryBot.create(:bootstrap_alert, body: body) }
  subject { render 'nfg_ui/bootstrap/alert', alert: alert }

  it 'outputs a bootstrap alert component in html' do
    expect(subject).to have_css '.alert'
    expect(subject).to have_css ".alert[role='alert']"
    expect(subject).to have_selector '.alert', text: body
    expect(subject).to eq "<div class='alert' role='alert'>\n#{body}\n</div>\n"
  end
end
