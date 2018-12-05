require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navbars/_navbar_nav.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:navbar_nav) { FactoryBot.create(:bootstrap_navbar_nav, body: body, **options) }
  let(:options) { {} }
  subject { navbar_nav.render }

  it 'outputs a bootstrap navbar component in html' do
    expect(subject).to have_selector '.navbar-nav', text: body
    expect(subject).to eq "<ul class=\"navbar-nav mr-auto\">#{body}</ul>"
  end

  describe 'horizontal alignment of navbar nav' do
    context 'when no alignment is set' do
      let(:options) { {} }
      it 'defaults to left alignment' do
        expect(subject).to have_css '.mr-auto'
        expect(subject).not_to have_css '.ml-auto'
      end
    end

    context 'when alignment is set to right' do
      let(:options) { { right: true } }
      it 'applies right alignment css classes' do
        expect(subject).not_to have_css '.mr-auto'
        expect(subject).to have_css '.ml-auto'
      end
    end
  end

  describe 'custom wrappable element' do
    context 'when no custom wrapper element is set' do
      let(:options) { {} }
      it { is_expected.to have_css 'ul.navbar-nav' }
    end

    context 'when a custom wrapper element is set' do
      let(:options) { { as: :div } }
      it { is_expected.to have_css 'div.navbar-nav' }
    end
  end
end
