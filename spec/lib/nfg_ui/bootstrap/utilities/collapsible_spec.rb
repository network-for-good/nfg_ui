require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Collapsible do
  # Button is collapsible
  let(:button) { FactoryBot.create(:bootstrap_button, **options, as: button_wrapper_el) }
  let(:button_wrapper_el) { :button }
  let(:options) { { collapse: collapse } }
  let(:collapse) { tested_collapse }
  let(:tested_collapse) { nil }

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

  describe '#html_options' do
    subject { button.html_options }

    context 'when :collapse is present in the options' do
      # NOTE: Button will remove data-target when button is a link. Manually set button component to :button element.
      let(:button_wrapper_el) { :button }
      let(:tested_collapse) { '#tested_collapse' }

      context 'when :data is already present within the options hash' do
        let(:options) { { data: { tested: :example }, collapse: tested_collapse } }
        it 'merges the two data hashes together' do
          expect(button.html_options[:data]).to eq(tested: :example, toggle: 'collapse', target: tested_collapse)
        end
      end

      context 'when :data is not already present within the options hash' do
        let(:options) { { collapse: tested_collapse } }
        it { expect(subject).to include(:data) }
        it { expect(button.html_options[:data]).to eq(toggle: 'collapse', target: tested_collapse) }
      end
    end

    context 'when :collapse is not present in the options' do
      let(:options) { {} }
      it { expect(subject).not_to include(:data) }
    end
  end

  describe '#collapse_data_attributes' do
    subject { button.send(:collapse_data_attributes) }
    let(:tested_collapse) { '#tested_collapse' }

    context 'when @collapse_data_attributes is not overwritten by the parent component' do
      it { is_expected.to eq(toggle: 'collapse', target: tested_collapse) }
    end

    context 'when @collapse_data_attributes has been overwritten by the parent component' do
      let(:tested_data_attributes) { { not: :collapse } }
      before { button.instance_variable_set(:@collapse_data_attributes, tested_data_attributes) }
      it { is_expected.to eq tested_data_attributes }
      it { is_expected.not_to eq(toggle: 'collapse', target: tested_collapse) }
    end
  end

  describe '#assistive_html_attributes' do
    subject { button.send(:assistive_html_attributes) }

    context 'when :collapse is present in the options' do
      context 'when :collapse is true' do
        let(:tested_collapse) { '#tested_collapse' }
        it { is_expected.to eq(aria: { expanded: 'false', controls: 'tested_collapse' }, role: 'button', type: 'button') }

        it 'removes the hash from the element ID for the aria-controls attribute' do
          expect(tested_collapse.chars.first).to eq '#'
          expect(subject[:aria][:controls]).to eq tested_collapse[1..-1]
        end
      end

      context 'when :collapse is false' do
        let(:tested_collapse) { false }
        it { is_expected.to eq(type: 'button') }
      end
    end

    context 'when :collapse is nil in the options' do
      let(:tested_collapse) { nil }
      it { is_expected.to eq(type: 'button') }
    end

    context 'when :collapse is not present in the options' do
      let(:options) { {} }
      it { is_expected.to eq(type: 'button') }
    end
  end

  describe '#non_html_attribute_options' do
    subject { button.send(:non_html_attribute_options) }
    it { is_expected.to include :collapse }
  end
end
