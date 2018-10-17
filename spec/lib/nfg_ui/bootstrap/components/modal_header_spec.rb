require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::ModalHeader do
  let(:modal_header) { FactoryBot.create(:bootstrap_modal_header, **options) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { modal_header.component_family }
    it { is_expected.to eq :modal }
  end

  describe '#title' do
    subject { modal_header.title }
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

  describe '#non_html_attribute_options' do
    subject { modal_header.send(:non_html_attribute_options) }
    it { is_expected.to include :title }
  end
end
