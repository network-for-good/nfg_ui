require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_progress.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:progress) { FactoryBot.create(:bootstrap_progress, body: body) }
  subject { render 'nfg_ui/bootstrap/progress', progress: progress }

  pending 'coming soon'

  it 'outputs a bootstrap progress component in html' do
  end
end
