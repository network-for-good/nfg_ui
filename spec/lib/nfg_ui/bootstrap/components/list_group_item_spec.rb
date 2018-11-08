require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::ListGroupItem do
  let(:list_group_item) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Wrappable utility module'
  it_behaves_like 'a component that includes the Activatable utility module'
  it_behaves_like 'a component that includes the Disableable utility module'
  it_behaves_like 'a component that includes the Themeable utility module', component_suite: :bootstrap

  describe '#component_family' do
    subject { list_group_item.component_family }
    it { is_expected.to eq :list_group }
  end

  describe '#action' do
    subject { list_group_item.action }
    
    context 'when action is true in options' do
      let(:options) { { action: true } }
      it { is_expected.to be }
    end

    context 'when action is not true in options' do
      let(:options) { { action: false } }
      it { is_expected.not_to be }
    end

    context 'when action is not present in options' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#badge' do
    subject { list_group_item.badge }
    
    context 'when badge is included in :options' do
      let(:tested_badge) { '123' }
      let(:options) { { badge: tested_badge } }
      it { is_expected.to eq tested_badge }
    end

    context 'when badge is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#default_theme' do
    subject { list_group_item.send(:default_theme) }
    it { is_expected.to be_nil }
  end

  describe '#default_html_wrapper_element' do
    subject { list_group_item.send(:default_html_wrapper_element) }
    it { is_expected.to eq :li }
  end

  describe '#css_classes' do
    subject { list_group_item.send(:css_classes) }
    describe ':action option' do
      context 'when action is true' do
        let(:options) { { action: true } }
        it { is_expected.to include 'list-group-item-action' }
      end

      context 'when action is false' do
        let(:options) { { action: false } }
        it { is_expected.not_to include 'list-group-item-action' }
      end

      context 'when action is not set' do
        let(:options) { {} }
        it { is_expected.not_to include 'list-group-item-action' }
      end
    end

    describe ':badge option' do
      context 'when badge is present' do
        let(:options) { { badge: 'present' } }
        it { is_expected.to include 'd-flex justify-content-between align-items-center' }
      end

      context 'when action is not present' do
        let(:options) { {} }
        it { is_expected.not_to include 'd-flex justify-content-between align-items-center' }
      end
    end
  end

  describe '#non_html_attribute_options' do
    subject { list_group_item.send(:non_html_attribute_options) }
    it { is_expected.to include :action, :badge }
  end
end
