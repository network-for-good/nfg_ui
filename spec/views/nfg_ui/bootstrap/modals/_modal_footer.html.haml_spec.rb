require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/modals/_modal_footer.html.haml', type: :view do
  let(:modal_footer) { FactoryBot.create(:bootstrap_modal_footer, **options) }

  let(:options) { { body: tested_body} }
  let(:tested_body) { 'Test body' }

  subject { render 'nfg_ui/bootstrap/modals/modal_footer', modal_footer: modal_footer }

  it 'renders the modal footer with text' do
    expect(subject).to have_selector '.modal-footer', text: tested_body
    expect(subject).to include "<div class='modal-footer'>\n#{tested_body}\n</div>"
  end
end
