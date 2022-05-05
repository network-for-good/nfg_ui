require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::BreadcrumbItem do
  let(:breadcrumb_item) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  subject { described_class }

  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Activatable utility module', component_suite: :bootstrap

  describe '#component_family' do
    subject { breadcrumb_item.component_family }
    it { is_expected.to eq :breadcrumb }
  end

  describe '#render' do
    subject { breadcrumb_item.render }
    let(:test_body) { 'Breadcrumb Text' }
    let(:options) { { href: test_link, body: test_body } }

    context 'when :href is present in options' do
      let(:test_link) { '#link' }

      it 'renders the <li> with a nested <a> link' do
        expect(subject).to eq "<li class=\"breadcrumb-item\"><a href=\"#{test_link}\">#{test_body}</a></li>"
      end
    end

    context 'when :href is not present in options' do
      let(:test_link) { nil }
      it 'renders the <li> only' do
        expect(subject).to eq "<li class=\"breadcrumb-item\">#{test_body}</li>"
      end
    end
  end

  describe 'private methods' do
    describe '#assistive_html_attributes' do
      subject { breadcrumb_item.send(:assistive_html_attributes) }
      context 'when the breadcrumb has :active set to true in options' do
        let(:options) { { active: true } }
        it { is_expected.to include(aria: { current: 'page' }) }
      end

      context 'when the breadcrumb has :active set to false in options' do
        let(:options) { { active: false } }
        it { is_expected.not_to include(aria: { current: 'page' }) }
      end

      context 'when the breadcrumb does not have :active set in options' do
        let(:options) { {} }
        it { is_expected.not_to include(aria: { current: 'page' }) }
      end
    end
  end
end
