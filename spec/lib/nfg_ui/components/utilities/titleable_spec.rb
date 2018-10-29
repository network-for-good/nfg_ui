require 'rails_helper'

RSpec.describe NfgUi::Components::Utilities::Titleable do
  let(:modal) { FactoryBot.create(:modal, title: title) }
  let(:title) { nil }
  let(:tested_title) { 'tested title' }

  describe '#title' do
    subject { modal.title }
    context 'when :title is present in the options hash' do
      let(:title) { tested_title }
      it { is_expected.to eq tested_title }
    end

    context 'when :title is not present in the options hash' do
      let(:title) { nil }
      it { is_expected.to be_nil }
    end
  end

  describe '#non_html_attribute_options' do
    subject { modal.send(:non_html_attribute_options) }
    it { is_expected.to include :title }
  end
end
