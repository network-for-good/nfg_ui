require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/list_groups/_list_group.html.haml', type: :view do
  let(:options) { {} }
  let(:test_body) { 'test body' }
  let(:list_group) { FactoryBot.create(:bootstrap_list_group, **options, body: test_body) }
  subject { render 'nfg_ui/bootstrap/list_groups/list_group', list_group: list_group }

  pending 'coming soon'
  
  it 'outputs a bootstrap list_group component in html' do
    expect(subject).to eq "<ul class=\"list-group\">#{test_body}\n</ul>"
  end

  describe 'a list group with a custom wrapper element' do
    context 'when a custom wrapper is passed in as :as in options' do
      let(:options) { { as: :div } }
      it 'outputs a list group as a div' do
        expect(subject).to have_css 'div.list-group'
        expect(subject).to eq "<div class=\"list-group\">#{test_body}\n</div>"
      end
    end

    context 'when a custom wrapper is not passed in as an :as option' do
      it 'utilizes the fallback default wrapping element' do
        expect(subject).to have_css 'ul.list-group'
        expect(subject).to eq "<ul class=\"list-group\">#{test_body}\n</ul>"
      end
    end
  end

  describe 'a flush list group' do
    context 'when list group is set to to flush in the :options' do
      let(:options) { { flush: true } }
      it 'applies the list group flush css class to the list group' do
        expect(subject).to have_css '.list-group.list-group-flush'
        expect(subject).to eq "<ul class=\"list-group list-group-flush\">#{test_body}\n</ul>"
      end
    end

    context 'when list group is not set to to flush in the :options' do
      let(:options) { {} }
      it 'applies the list group flush css class to the list group' do
        expect(subject).not_to have_css '.list-group.list-group-flush'
        expect(subject).to eq "<ul class=\"list-group\">#{test_body}\n</ul>"
      end
    end
  end
end
