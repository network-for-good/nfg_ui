require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_nav.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:nav) { FactoryBot.create(:bootstrap_nav, body: body) }
  subject { render 'nfg_ui/bootstrap/nav', nav: nav }

  pending 'coming soon'

  it 'outputs a bootstrap nav component in html' do
  end
end
