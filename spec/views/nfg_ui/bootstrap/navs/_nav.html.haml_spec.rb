require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navs/_nav.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:nav) { FactoryBot.create(:bootstrap_nav, body: body, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/navs/nav', nav: nav }

  it 'outputs a bootstrap nav component in html' do
    expect(subject).to have_selector 'ul.nav', text: body
    expect(subject).to eq "<ul class=\"nav\">#{body}\n</ul>"
  end

  describe 'horizontal nav alignment' do
    context 'when nav is centered' do
      let(:options) { { center: true } }
      it 'outputs a centered nav' do
        expect(subject).to have_css '.nav.justify-content-center'
        expect(subject).to eq "<ul class=\"nav justify-content-center\">#{body}\n</ul>"
      end
    end

    context 'when nav is right' do
      let(:options) { { right: true } }
      it 'outputs a right aligned nav' do
        expect(subject).to have_css '.nav.justify-content-end'
        expect(subject).to eq "<ul class=\"nav justify-content-end\">#{body}\n</ul>"
      end
    end
  end

  describe 'vertical alignment' do
    let(:options) { { vertical: true } }
    it 'outputs a vertical nav' do
      expect(subject).to have_css '.nav.flex-column'
      expect(subject).to eq "<ul class=\"nav flex-column\">#{body}\n</ul>"
    end
  end

  describe 'custom wrapper element for nav' do
    let(:tested_element) { :b }
    let(:options) { { as: tested_element } }
    it 'outputs a nav utilizing a custom wrapper element' do
      expect(subject).to have_css "#{tested_element}.nav"
      expect(subject).to eq "<#{tested_element} class=\"nav\">#{body}\n</#{tested_element}>"
    end
  end

  describe 'nav fill' do
    let(:options) { { fill: true } }
    it 'outputs a nav with fill' do
      expect(subject).to have_css '.nav.nav-fill'
      expect(subject).to eq "<ul class=\"nav nav-fill\">#{body}\n</ul>"
    end
  end

  describe 'justified nav' do
    let(:options) { { justified: true } }
    it 'outputs a justified nav' do
      expect(subject).to have_css '.nav.nav-justified'
      expect(subject).to eq "<ul class=\"nav nav-justified\">#{body}\n</ul>"
    end
  end

  describe 'nav tabs' do
    let(:options) { { tabs: true } }
    it 'outputs a nav with tabs' do
      expect(subject).to have_css '.nav.nav-tabs'
      expect(subject).to eq "<ul class=\"nav nav-tabs\">#{body}\n</ul>"
    end
  end

  describe 'nav pills' do
    let(:options) { { pill: true } }
    it 'outputs a nav with tabs' do
      expect(subject).to have_css '.nav.nav-pills'
      expect(subject).to eq "<ul class=\"nav nav-pills\">#{body}\n</ul>"
    end
  end
end
