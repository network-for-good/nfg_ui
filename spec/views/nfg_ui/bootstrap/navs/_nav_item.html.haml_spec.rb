require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navs/_nav_item.html.haml', type: :view do
  let(:tested_href) { 'http://www.website.edu' }
  let(:body) { 'test body content' }
  let(:nav_item) { FactoryBot.create(:bootstrap_nav_item, body: body, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/navs/nav_item', nav_item: nav_item }

  it 'outputs a bootstrap nav item component in html' do
    expect(subject).to have_selector 'li.nav-item', text: body
    expect(subject).to eq "<li class=\"nav-item\">#{body}\n</li>"
  end

  describe 'nav_item component with a child nav_link' do
    context 'a nav item without an automatically generated nav_link' do
      let(:options) { {} }
      it 'outputs a nav_item without a child nav_link' do
        expect(subject).to have_css 'li.nav-item'
        expect(subject).not_to have_css 'a.nav-link'
      end
    end

    context 'a nav item with an included nav_link' do
      let(:options) { { href: tested_href } }
      it 'outputs a nav_item with a child nav_link' do
        expect(subject).to have_css 'li.nav-item a.nav-link'
        expect(subject).to eq "<li class=\"nav-item\"><a class='nav-link' href='#{tested_href}'>\n#{body}\n</a>\n\n</li>"
      end
    end
  end

  describe 'nav item as a dropdown with a dropdown menu' do
    let(:dropdown_menu) { FactoryBot.create(:bootstrap_dropdown_menu, :rendered) }
    let(:nav_item) { FactoryBot.create(:bootstrap_nav_item, button: body, body: dropdown_menu, **options) }
    let(:options) { { dropdown: true } }
    it 'outputs a nav with a dropdown toggle and dropdown menu' do
      expect(subject).to have_css '.nav-item.dropdown .dropdown-toggle + .dropdown-menu'
      expect(subject).to eq "<li class=\"nav-item dropdown\"><a class=\"dropdown-toggle nav-link\" data-toggle=\"dropdown\" dropdown=\"true\" aria-haspopup=\"true\" aria-expanded=\"false\" href=\"#\">#{body}\n\n</a>\n\n<div class='dropdown-menu'>\n\n</div>\n\n</li>"
    end
  end

  describe 'an active nav_item' do
    context 'when the nav_item is set to active' do
      let(:options) { { active: true, href: tested_href } }
      it 'applies the active css class to the child nav_link' do
        expect(subject).to have_css '.nav-item .nav-link.active'
        expect(subject).to eq "<li class=\"nav-item\"><a class='nav-link active' href='#{tested_href}'>\n#{body}\n</a>\n\n</li>"
      end
    end

    context 'when nav item is not set to active' do
      let(:options) { { active: false, href: tested_href } }
      it 'does not apply an active class on the child nav_link' do
        expect(subject).not_to have_css '.nav-item .nav-link.active'
        expect(subject).to have_css '.nav-item .nav-link'
      end
    end
  end

  describe 'a disabled nav_item' do
    context 'when the nav_item is set to disabled' do
      let(:options) { { disabled: true, href: tested_href } }
      it 'applies the disabled css class to the child nav_link' do
        expect(subject).to have_css '.nav-item .nav-link.disabled'
        expect(subject).to eq "<li class=\"nav-item\"><a class='nav-link disabled' href='#{tested_href}' tabindex='-1'>\n#{body}\n</a>\n\n</li>"
      end
    end

    context 'when nav item is not set to disabled' do
      let(:options) { { disabled: false, href: tested_href } }
      it 'does not apply an disabled class on the child nav_link' do
        expect(subject).not_to have_css '.nav-item .nav-link.disabled'
        expect(subject).to have_css '.nav-item .nav-link'
      end
    end
  end

  describe 'a custom element applied to the nav_item' do
    context 'when a custom wrapper element is set via :as in the options' do
      let(:tested_element) { :b }
      let(:options) { { as: tested_element } }
      it 'applies the disabled css class to the child nav_link' do
        expect(subject).to have_css "#{tested_element}.nav-item"
        expect(subject).to eq "<#{tested_element} class=\"nav-item\">#{body}\n</#{tested_element}>"
      end
    end

    context 'when a custom wrapper element is not set via :as in the options' do
      let(:options) { {} }
      it 'does not apply an disabled class on the child nav_link' do
        expect(subject).to have_css 'li.nav-item'
      end
    end
  end
end
