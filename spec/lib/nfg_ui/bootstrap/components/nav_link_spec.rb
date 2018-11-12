require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::NavLink do
  let(:nav_link) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Activatable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Disableable utility module', component_suite: :bootstrap

  describe '#component_family' do
    subject { nav_link.component_family }
    it { is_expected.to eq :nav }
  end

  describe '#dropdown' do
    subject { nav_link.dropdown }
    context 'when dropdown is true in options' do
      let(:options) { { dropdown: true } }
      it { is_expected.to be }
    end

    context 'when dropdown is nil in options' do
      let(:options) { { dropdown: nil } }
      it { is_expected.to be_nil }
    end

    context 'when dropdown is not present in options' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#href' do
    subject { nav_link.href }
    context 'when href is present in options' do
      let(:tested_href) { '#tested_href.html' }
      let(:options) { { href: tested_href } }
      it { is_expected.to eq tested_href }
    end

    context 'when href is nil in options' do
      let(:options) { { href: nil } }
      it { is_expected.to be_nil }
    end

    context 'when href is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#tab' do
    subject { nav_link.tab }
    context 'when tab is true in options' do
      let(:options) { { tab: true } }
      it { is_expected.to be }
    end

    context 'when tab is nil in options' do
      let(:options) { { tab: nil } }
      it { is_expected.to be_nil }
    end

    context 'when tab is not present in options' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#data' do
    subject { nav_link.data }
    context 'when tab is truthy options' do
      let(:options) { { tab: '#test_tab' } }
      it { is_expected.to eq(toggle: 'tab') }
    end

    context 'when tab is falsey options' do
      let(:options) { { tab: nil } }
      it { is_expected.not_to eq(toggle: 'tab') }
      it { is_expected.to eq({}) }
    end
  end

  describe '#assistive_html_attributes' do
    subject { nav_link.send(:assistive_html_attributes) }
    context 'when tab is present in options' do
      let(:test_tab_word) { 'test_tab' }
      let(:tested_tab) { "##{test_tab_word}" }
      
      context 'when active is true in options' do
        let(:options) { { tab: tested_tab, active: true } }
        it { is_expected.to eq(role: 'tab', aria: { controls: test_tab_word, selected: true }) }
      end

      context 'when active is falsey in options' do
        let(:options) { { tab: tested_tab } }
        it { is_expected.to eq(role: 'tab', aria: { controls: test_tab_word, selected: false }) }
      end
    end

    context 'when tab is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq({}) }
    end
  end

  describe '#non_html_attribute_options' do
    subject { nav_link.send(:non_html_attribute_options) }
    it { is_expected.to include :tab, :dropdown }
  end
end
