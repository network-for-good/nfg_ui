RSpec.describe 'nfg_ui/bootstrap/paginations/_page_item.html.haml', type: :view do
  let(:page_item) { FactoryBot.create(:bootstrap_page_item, body: tested_body, **options) }
  let(:tested_body) { 'tested body' }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/paginations/page_item', page_item: page_item }

  describe 'component html' do
    it 'outputs a bootstrap page item component in html' do
      expect(subject).to have_selector "li.page-item a.page-link[href='#']", text: tested_body
      expect(subject).to eq "<li class='page-item'>\n<a class='page-link' href='#'>\n#{tested_body}\n</a>\n</li>\n"
    end
  end

  describe 'a disabled page item' do
    let(:tested_disabled) { nil }
    let(:options) { { disabled: tested_disabled } }
    context 'when a page item is disabled in options' do
      let(:tested_disabled) { true }
      it 'outputs a disabled page item' do
        expect(subject).to have_css "li.page-item.disabled .page-link[tabindex='-1']"
        expect(subject).to eq "<li class='page-item disabled'>\n<a class='page-link' href='#' tabindex='-1'>\n#{tested_body}\n</a>\n</li>\n"
      end
    end

    context 'when a page item is not set to disabled' do
      let(:tested_disabled) { false }
      it 'does not output a disabled page item' do
        expect(subject).not_to have_css "li.page-item.disabled .page-link[tabindex='-1']"
        expect(subject).to eq "<li class='page-item'>\n<a class='page-link' href='#'>\n#{tested_body}\n</a>\n</li>\n"
      end
    end
  end

  describe 'an active page item' do
    let(:tested_active) { nil }
    let(:options) { { active: tested_active } }
    context 'when a page item is active in options' do
      let(:tested_active) { true }
      it 'outputs a active page item' do
        expect(subject).to have_css "li.page-item.active span.sr-only"
        expect(subject).to eq "<li class='page-item active'>\n<a class='page-link' href='#'>\ntested body\n<span class='sr-only'>(current)</span>\n</a>\n</li>\n"
      end
    end

    context 'when a page item is not set to active' do
      let(:tested_active) { false }
      it 'does not output a active page item' do
        expect(subject).not_to have_css "li.page-item.active"
        expect(subject).to eq "<li class='page-item'>\n<a class='page-link' href='#'>\n#{tested_body}\n</a>\n</li>\n"
      end
    end
  end
end
