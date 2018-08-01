require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_form.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:form) { FactoryBot.create(:bootstrap_form, body: body) }
  subject { render 'nfg_ui/bootstrap/form', form: form }

  pending 'coming soon'

  it 'outputs a bootstrap form component in html' do
  end
end
