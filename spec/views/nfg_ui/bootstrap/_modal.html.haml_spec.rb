require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_modal.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:modal) { FactoryBot.create(:bootstrap_modal, **options) }

  let(:options) { { title: title, body: body, footer: footer } }
  let(:title) { nil }
  let(:tested_title) { 'Test title' }
  let(:body) { nil }
  let(:tested_body) { 'Test body' }
  let(:footer) { nil }
  let(:tested_footer) { 'Test footer' }

  subject { render 'nfg_ui/bootstrap/modal', modal: modal }

  describe 'modal html that is always present' do
    it 'has the correct wrapping element attributes' do
      expect(subject).to have_css '.modal.fade'
      expect(subject).to have_css ".modal[role='dialog']"
      expect(subject).to have_css ".modal[tabindex='-1']"
      expect(subject).to have_css ".modal .modal-dialog[role='document']"
      expect(subject).to have_css '.modal .modal-content'
      expect(subject).to have_css '.modal .modal-header'
      expect(subject).to have_css '.modal .modal-body'

      # sanity check to make sure more attributes didn't sneak in.
      expect(subject).to include "<div class='modal fade' role='dialog' tabindex='-1'>\n<div class='modal-dialog' role='document'>\n<div class='modal-content'>"
      expect(subject).to include "<div class='modal-header'>\n<button class=\"btn close\" data-dismiss=\"modal\" aria-label=\"Close\" type=\"button\"><span aria-hidden='true'>\n&times;\n</span>\n\n</button></div>"
      expect(subject).to include "<div class='modal-body'>"
    end
  end

  describe 'rendering the component with content' do
    describe 'a modal with a title' do
      context 'and when a modal has a title' do
        let(:title) { tested_title }
        it 'renders the modal title with text' do
          expect(subject).to have_selector '.modal-header h5.modal-title', text: tested_title
          expect(subject).to include "<h5 class='modal-title'>#{tested_title}</h5>"
        end
      end

      context 'and when a modal does not have a title' do
        let(:title) { nil }
        it 'does not render the modal title with text' do
          expect(subject).not_to have_css '.modal-header h5.modal-title'
          expect(subject).not_to include "<h5 class='modal-title'>"
        end
      end
    end

    describe 'a modal with body content' do
      context 'and when a modal has a body' do
        let(:body) { tested_body }
        it 'renders the modal body' do
          expect(subject).to have_selector '.modal-body', text: tested_body
          expect(subject).to include "<div class='modal-body'>#{tested_body}</div>"
        end
      end

      context 'and when a modal does not have a body' do
        let(:body) { nil }
        it 'renders the modal body without text' do
          expect(subject).to include "<div class='modal-body'></div>"
        end
      end
    end

    describe 'a modal with a footer' do
      context 'and when a modal has a footer' do
        let(:footer) { tested_footer }
        it 'renders the modal footer with text' do
          expect(subject).to have_selector '.modal-footer', text: tested_footer
          expect(subject).to include "<div class='modal-footer'>#{tested_footer}</div>"
        end
      end

      context 'and when a modal does not have a footer' do
        let(:footer) { nil }
        it 'does not render the modal footer with text' do
          expect(subject).not_to have_css '.modal-footer'
          expect(subject).not_to include "<div class='modal-footer'>"
        end
      end
    end
  end
end
