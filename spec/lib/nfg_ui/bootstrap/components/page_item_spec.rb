require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::PageItem do
  let(:page_item) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Activatable utility module', component_suite: :bootstrap

  describe '#component_family' do
    subject { page_item.component_family }
    it { is_expected.to eq :pagination }
  end

  describe '#disabled' do
    subject { page_item.disabled }
    context 'when disabled is true' do
      let(:options) { { disabled: true } }
      it { is_expected.to be }
    end

    context 'when disabled is false' do
      let(:options) { { disabled: false } }
      it { is_expected.not_to be }
    end

    context 'when disabled is not set' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end

    context 'when disabled is nil' do
      let(:options) { { disabled: nil } }
      it { is_expected.to be_falsy }
    end
  end

  describe '#href' do
    subject { page_item.href }
    context 'when href is present in options' do
      let(:tested_href) { 'tested-href' }
      let(:options) { { href: tested_href } }
      it { is_expected.to eq tested_href }
    end

    context 'when href is nil in options' do
      let(:options) { { href: nil } }
      it { is_expected.to eq '#' }
    end

    context 'when href is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq '#' }
    end

    context 'when href is an empty string in options' do
      let(:options) { { href: '' } }
      it { is_expected.to eq '#' }
    end
  end

  describe '#html_options' do
    subject { page_item.html_options }
    it 'excludes :href from html_options' do
      expect(page_item.html_options.keys).not_to include :href
    end
  end

  describe '#page_link_html_options' do
    subject { page_item.page_link_html_options }
    context 'when disabled is true in options' do
      let(:options) { { disabled: true } }
      it 'includes a negative tabindex' do
        expect(subject).to eq(class: 'page-link', href: '#', tabindex: '-1')
      end
    end

    context 'when disabled is falsy' do
      let(:options) { {} }
      it 'does not include a negative tabindex' do
        expect(subject).to eq(class: 'page-link', href: '#')
        expect(subject.keys).not_to include :tabindex
      end
    end
  end

  describe 'private methods' do
    describe '#css_classes' do
      subject { page_item.send(:css_classes) }
      context 'when disabled is true' do
        let(:options) { { disabled: true } }
        it 'includes the disabled css class' do
          expect(subject).to include 'disabled'
        end
      end

      context 'when disabled is falsy' do
        let(:options) { { disabled: false } }
        it 'does not include the disabled css class' do
          expect(subject).not_to include 'disabled'
        end
      end
    end

    describe '#non_html_attribute_options' do
      subject { page_item.send(:non_html_attribute_options) }
      it { is_expected.to include :disabled }
    end
  end
end
