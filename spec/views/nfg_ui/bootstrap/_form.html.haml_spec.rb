require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_form.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:form) { FactoryBot.create(:bootstrap_form, body: body) }
  subject { render 'nfg_ui/bootstrap/form', form: form }

  it 'outputs a bootstrap form component in html' do
    expect(subject).to have_css '.form'
    expect(subject).to have_selector '.form', text: body
    expect(subject).to eq "<div class='form'>\n#{body}\n</div>\n"
  end
end
