require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/breadcrumbs/_breadcrumb_item.html.haml', type: :view do
  let(:breadcrumb_item) { FactoryBot.create(:bootstrap_breadcrumb_item, **options) }
  let(:options) { {} }
  subject { breadcrumb_item.render }

  describe 'html output for the bootstrap badge' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap breadcrumb component in html' do
      expect(subject).to have_css 'li.breadcrumb-item'
      expect(subject).to have_selector 'li.breadcrumb-item', text: body
      expect(subject).to eq "<li class=\"breadcrumb-item\">#{body}</li>"
    end

    describe 'active breadcrumb item' do
      context 'when the breadcrumb is set as active' do
        let(:options) { { active: true, body: body } }
        it 'outputs an active breadcrumb item' do
          expect(subject).to have_css '.breadcrumb-item.active'
          expect(subject).to have_css ".active[aria-current='page']"
          expect(subject).to include "<li class=\"breadcrumb-item active\" aria-current=\"page\">"
        end
      end

      context 'when the breadcrumb is not active' do
        let(:options) { { active: false, body: body } }
        it 'does not output an active breadcrumb item' do
          expect(subject).to have_css '.breadcrumb-item'
          expect(subject).not_to have_css '.active'
          expect(subject).not_to have_css "[aria-current]"
          expect(subject).not_to include "aria-current='page", 'class=\"breadcrumb-item active\"'
        end
      end
    end
  end
end
