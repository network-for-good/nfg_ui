require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/modals/_modal_header.html.haml', type: :view do
  let(:modal_header) { FactoryBot.create(:bootstrap_modal_header, **options) }

  let(:options) { { title: title} }
  let(:title) { tested_title }
  let(:tested_title) { 'Test title' }

  subject { render 'nfg_ui/bootstrap/modals/modal_header', modal_header: modal_header }

  it 'accurately renders the modal header HTML' do
    expect(subject).to eq "<div class='modal-header'>\n<h5 class='modal-title'>#{tested_title}</h5>\n<button class=\"btn close\" data-dismiss=\"modal\" aria-label=\"Close\" type=\"button\"><span aria-hidden='true'>\n&times;\n</span>\n\n</button></div>\n"
  end

  it 'renders the close button' do
    # text expectation is for &times; _not_ the letter 'x'
    expect(subject).to have_selector "button.close[data-dismiss='modal'][aria-label='Close']", text: '×'
    expect(subject).to have_css "span[aria-hidden='true']"
  end

  describe 'a textual title within the modal header component' do
    context 'when a modal has a title' do
      let(:title) { tested_title }
      it 'renders the modal title with text' do
        expect(subject).to have_selector '.modal-header h5.modal-title', text: tested_title
        expect(subject).to include "<h5 class='modal-title'>#{tested_title}</h5>"
      end
    end

    context 'when a modal does not have a title' do
      let(:title) { nil }
      it 'does not render the modal title with text' do
        expect(subject).not_to have_css '.modal-header h5.modal-title'
        expect(subject).not_to include "<h5 class='modal-title'>"
      end
    end
  end
end
