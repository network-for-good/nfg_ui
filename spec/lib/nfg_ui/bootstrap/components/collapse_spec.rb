require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Collapse do
  let(:collapse) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { { id: test_id } }
  let(:test_id) { 'test_id' }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction', required_options: { id: 'test_id' }

  describe '#collapsed' do
    subject { collapse.collapsed }

    context 'when :collapsed is present within options' do
      let(:test_collapsed) { false }
      let(:options) { { id: test_id, collapsed: test_collapsed } }
      it { is_expected.to eq test_collapsed }
    end

    context 'when :collapsed is not present within options' do
      let(:options) { { id: test_id } }
      it { is_expected.to be }
    end
  end

  describe '#navbar' do
    subject { collapse.navbar }

    context 'when :navbar is present within options' do
      let(:options) { { id: test_id, navbar: true } }
      it { is_expected.to be }
    end

    context 'when :navbar is not present within options' do
      let(:options) { { id: test_id } }
      it { is_expected.not_to be }
    end
  end

  describe 'private methods' do
    describe '#css_classes' do
      subject { collapse.send(:css_classes) }
      let(:options) { { id: test_id, collapsed: test_collapsed } }

      context 'when the component has :collapsed set as true' do
        let(:test_collapsed) { true }
        it { is_expected.not_to include 'show' }
      end

      context 'when the component has :collapsed set to false' do
        let(:test_collapsed) { false }
        it { is_expected.to include 'show' }
      end

      context 'when navbar is true in options' do
        let(:options) { { navbar: true } }
        it { is_expected.to include 'navbar-collapse' }
      end

      context 'when navbar is falsey in options' do
        let(:options) { {} }
        it { is_expected.not_to include 'navbar-collapse' }
      end
    end

    describe '#non_html_attribute_options' do
      subject { collapse.send(:non_html_attribute_options) }
      it { is_expected.to include :collapsed, :navbar }
    end
  end
end
