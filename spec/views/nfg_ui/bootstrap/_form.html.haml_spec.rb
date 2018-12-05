require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_form.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:form) { FactoryBot.create(:bootstrap_form, body: body) }
  subject { form.render }

  it 'outputs a bootstrap form component in html' do
    expect(subject).to have_css '.form'
    expect(subject).to have_selector '.form', text: body
    expect(subject).to eq "<div class=\"form\">#{body}</div>"
  end
end
