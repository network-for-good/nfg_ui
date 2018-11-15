require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/modals/_modal_body.html.haml', type: :view do
  let(:modal_body) { FactoryBot.create(:bootstrap_modal_body, **options) }

  let(:options) { { body: tested_body} }
  let(:tested_body) { 'Test body' }

  subject { render 'nfg_ui/bootstrap/modals/modal_body', modal_body: modal_body }

  it 'renders the modal body' do
    expect(subject).to have_selector '.modal-body', text: tested_body
    expect(subject).to include "<div class='modal-body'>\n#{tested_body}\n</div>"
  end
end
