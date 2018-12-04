require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/list_groups/_list_group_item.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:list_group_item) { FactoryBot.create(:bootstrap_list_group_item, **options, body: body) }
  let(:options) { {} }

  subject { list_group_item.render }

  describe 'a standard list-group-item with no additional options' do
    let(:options) { {} }
    it 'outputs a conventional list-group-item as an <li>' do
      expect(subject).to have_css 'li.list-group-item'
      expect(subject).to eq "<li class=\"list-group-item\">#{body}</li>"
    end
  end

  describe 'a disabled list-group-item' do
    context 'when a list group item is set as disabled in the options' do
      let(:options) { { disabled: true } }
      it 'outputs a disabled list-group-item' do
        expect(subject).to have_css 'li.list-group-item.disabled'
        expect(subject).to eq  "<li class=\"list-group-item disabled\" tabindex=\"-1\">#{body}</li>"
      end
    end

    context 'when a list group item is not set as disabled in the options' do
      let(:options) { {} }
      it 'does not output a disabled list group item' do
        expect(subject).not_to have_css 'li.list-group-item.disabled'
      end
    end
  end

  describe 'a thematic list-group-item' do
    context 'when no theme is supplied' do
      let(:options) { {} }
      it 'does not apply a theme' do
        expect(subject).not_to have_css ".list-group-item-#{NfgUi::DEFAULT_BOOTSTRAP_THEME.to_s}"
      end
    end
    context 'when a theme is supplied' do
      let(:test_theme) { :secondary }
      let(:options) { { theme: test_theme } }

      it 'outputs a thematic list-group-item' do
        expect(subject).to have_css "li.list-group-item-#{test_theme.to_s}"
        expect(subject).to eq "<li class=\"list-group-item list-group-item-#{test_theme.to_s}\">#{body}</li>"
      end
    end
  end

  describe 'an action list-group-item' do
    context 'when a list group item is set as actionable (action true) in the options' do
      let(:options) { { action: true } }
      it 'outputs an actionable list-group-item' do
        expect(subject).to have_css 'li.list-group-item-action'
        expect(subject).to eq "<li class=\"list-group-item list-group-item-action\">#{body}</li>"
      end
    end

    context 'when a list group item is not set as actionable in the options' do
      let(:options) { {} }
      it 'does not output an actionable list-group-item' do
        expect(subject).not_to have_css 'li.list-group-item.list-group-item-action'
      end
    end
  end

  describe 'an active list-group-item' do
    context 'when the list group item is supplied :active in options' do
      let(:options) { { active: true } }
      it 'outputs an active list-group-item' do
        expect(subject).to have_css 'li.active'
        expect(subject).to eq "<li class=\"list-group-item active\">#{body}</li>"
      end
    end

    context 'when the list group item is not set to be :active in options' do
      let(:options) { {} }
      it 'does not output an active list group item' do
        expect(subject).not_to have_css '.list-group-item.active'
      end
    end
  end

  describe 'a custom element (:as) list-group-item' do
    context 'when the list group item is passed an :as option' do
      let(:options) { { as: :a } }
      it 'outputs a list-group-item as an <a> tag' do
        expect(subject).to have_css 'a.list-group-item'
        expect(subject).to eq "<a class=\"list-group-item\">#{body}</a>"
      end
    end

    context 'and when the list group item is not passed an :as option' do
      let(:options) { {} }
      it 'outputs the default list group item as an <li>' do
        expect(subject).to eq "<li class=\"list-group-item\">#{body}</li>"
      end
    end
  end

  describe 'a list group item with a badge' do
    context 'when the list group item has a badge in the options' do
      let(:tested_badge) { '123' }
      let(:options) { { badge: tested_badge } }
      it { is_expected.to have_selector 'li.list-group-item.d-flex.justify-content-between.align-items-center .badge.badge-pill', text: tested_badge }

      context 'when no theme is supplied to the list group item' do
        it 'renders a primary theme badge' do
          expect(subject).to have_css '.list-group-item .badge.badge-pill.badge-primary'
          expect(subject).to eq "<li class=\"list-group-item d-flex justify-content-between align-items-center\">#{body}<span class=\"badge badge-primary badge-pill\">#{tested_badge}</span></li>"
        end
      end

      context 'when a theme is supplied to the list group item' do
        let(:tested_theme) { :danger }
        let(:options) { { badge: tested_badge, theme: tested_theme } }
        it "applies the parent list group item's theme to the badge" do
          expect(subject).to have_css ".list-group-item .badge.badge-#{tested_theme.to_s}"
        end
      end
    end

    context 'when the list group item does not have a badge in the options' do
      let(:options) { {} }
      it 'does not render a badge' do
        expect(subject).not_to have_css '.list-group-item .badge'
      end
    end
  end
end
