require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_modal.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:modal) { FactoryBot.create(:bootstrap_modal, body: body) }
  subject { render 'nfg_ui/bootstrap/modal', modal: modal }

  pending 'coming soon'

  it 'outputs a bootstrap modal component in html' do
  end
end
