require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::TabPane do
  let(:tab_pane) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Activatable utility module', component_suite: :bootstrap

  describe '#component_family' do
    subject { tab_pane.component_family }
    it { is_expected.to eq :tab }
  end

  describe '#tab' do
    subject { tab_pane.tab }
    context 'when tab is present in options' do
      let(:tested_tab) { '#tested-tab' }
      let(:options) { { tab: tested_tab } }
      it { is_expected.to eq tested_tab }
    end

    context 'when tab is nil in options' do
      let(:options) { { tab: nil } }
      it { is_expected.to be_nil }
    end

    context 'when tab is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#id' do
    subject { tab_pane.id }
    context 'when tab is present in options' do
      let(:tested_tab) { '#tested-tab' }
      let(:options) { { tab: tested_tab } }
      it { is_expected.to eq tested_tab.tr('#', '') }

      context 'when id is also present' do
        let(:tested_id) { 'tested_id' }
        let(:options) { { tab: tested_tab, id: tested_id } }
        it 'prefers the tab instead of the id passed in via options' do
          expect(subject).to eq tested_tab.tr('#', '')
        end
      end
    end

    context 'when id is nil in options' do
      let(:options) { { id: nil } }
      it { is_expected.to be_nil }
    end

    context 'when id is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#fade' do
    subject { tab_pane.fade }
    context 'when fade is true in options' do
      let(:options) { { fade: true } }
      it { is_expected.to be }
    end

    context 'when fade is nil in options' do
      let(:options) { { fade: nil } }
      it { is_expected.to be_nil }
    end

    context 'when fade is not present in options' do
      let(:options) { {} }
      it 'defaults to true' do
        expect(subject).to be
      end
    end
  end

  describe '#css_classes' do
    subject { tab_pane.send(:css_classes) }
    describe ':fade in options' do
      context 'when :fade is true' do
        let(:options) { { fade: true } }
        it { is_expected.to include 'fade' }
      end

      context 'when :fade is false' do
        let(:options) { { fade: false } }
        it { is_expected.not_to include 'fade' }
      end

      context 'when :fade is not present' do
        let(:options) { {} }
        it 'applies fade by default' do
          expect(subject).to include 'fade'
        end
      end
    end

    describe ':active in options' do
      context 'when active is true' do
        let(:options) { { active: true } }
        it { is_expected.to include 'show' }
      end

      context 'when active is false' do
        let(:options) { { active: false } }
        it { is_expected.not_to include 'show' }
      end

      context 'when active is not present' do
        let(:options) { {} }
        it { is_expected.not_to include 'show' }
      end
    end
  end

  describe '#non_html_attribute_options' do
    subject { tab_pane.send(:non_html_attribute_options) }
    it { is_expected.to include :tab }
  end

  describe '#assistive_html_attributes' do
    subject { tab_pane.send(:assistive_html_attributes) }
    it { is_expected.to eq(role: 'tabpanel') }
  end
end
