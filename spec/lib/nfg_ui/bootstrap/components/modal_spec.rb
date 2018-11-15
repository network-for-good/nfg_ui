require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Modal do
  let(:modal) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { { body: body, footer: footer_text } }
  let(:body) { 'test body' }
  let(:footer_text) { nil }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { modal.component_family }
    it { is_expected.to eq :modal }
  end

  describe '#title' do
    subject { modal.title }
    let(:tested_title) { 'tested title' }
    context 'when title is present in options' do
      let(:options) { { title: tested_title } }
      it { is_expected.to eq tested_title }
    end

    context 'when title is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#footer' do
    subject { modal.footer }
    context 'when footer is present' do
      let(:footer_text) { 'test footer' }
      it { is_expected.to eq footer_text }
    end

    context 'when footer is not present' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end

    context 'when footer is nil' do
      let(:options) { { footer: nil } }
      it { is_expected.to be_nil }
    end
  end

  describe '#css_classes' do
    subject { modal.send(:css_classes) }
    it { is_expected.to eq 'modal fade' }
  end

  describe '#non_html_attribute_options' do
    subject { modal.send(:non_html_attribute_options) }
    context 'when footer is present' do
      let(:footer_text) { 'test footer' }
      it { is_expected.to include :footer }
    end

    context 'when footer is nil' do
      let(:footer_text) { nil }
      it { is_expected.not_to include :footer }
    end

    context 'when footer is not present' do
      let(:options) { {} }
      it { is_expected.not_to include :footer }
    end

    context 'when title is present' do
      let(:title) { 'test_title' }
      let(:options) { { title: title } }
      it { is_expected.to include :title }

    end

    context 'when title is not present' do
      it { is_expected.not_to include :title }
    end
  end

  describe '#assistive_html_attributes' do
    subject { modal.send(:assistive_html_attributes) }
    it { is_expected.to include(role: 'dialog', tabindex: '-1', aria: { hidden: 'true' }) }
  end
end
