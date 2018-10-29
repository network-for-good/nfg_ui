require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Collapsible do
  # Button is collapsible
  let(:button) { FactoryBot.create(:bootstrap_button, **options, as: button_wrapper_el) }
  let(:button_wrapper_el) { :button }
  let(:options) { { collapse: collapse } }
  let(:collapse) { tested_collapse }
  let(:tested_collapse) { nil }

  pending 'Specs needed for Collapsible utility'

  describe '#collapse' do
    subject { button.collapse }
    context 'when collapse is present' do
      let(:tested_collapse) { '#tested_collapse' }
      it { is_expected.to eq tested_collapse }
    end

    context 'when :collapse is nil in the options' do
      let(:tested_collapse) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :collapse is not present in the options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#collapsed' do
    subject { button.collapsed }
  end

  describe '#collapsible' do
    subject { button.collapsible }
  end

  describe '#non_html_attribute_options' do
    subject { button.send(:non_html_attribute_options) }
    it { is_expected.to include :collapse, :collapsed, :collapsible }
  end
end
