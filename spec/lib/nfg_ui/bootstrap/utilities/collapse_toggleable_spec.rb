require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::CollapseToggleable do
  # Button is collapsible
  let(:button) { FactoryBot.create(:bootstrap_button, **options, as: button_wrapper_el) }
  let(:button_wrapper_el) { :button }
  let(:options) { { collapse: collapse } }
  let(:collapse) { tested_collapse }
  let(:tested_collapse) { nil }
  
  it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Collapsible }

  describe '#data' do
    subject { button.data }
    context 'when collapse is present in options' do
      let(:tested_collapse) { '#tested-collapse' }
      context 'and when additional data attributes are present' do
        let(:tested_data_key) { 'test-key' }
        let(:tested_data_value) { 'tested-value' }
        let(:options) { { collapse: tested_collapse, data: { tested_data_key => tested_data_value } } }

        it 'merges in the collapse data attributes to the existing data attributes' do
          expect(subject).to eq(toggle: 'collapse', target: collapse, tested_data_key => tested_data_value)
        end
      end

      context 'and when additional data attributes are not present' do
        before { button.options[:data] = {} }
        it 'only applies the collapse toggle data attributes' do
          expect(subject).to eq(toggle: 'collapse', target: tested_collapse)
        end
      end
    end

    context 'when collapse is not present in options' do
      let(:options) { {} }
      it 'does not merge in collapse data attributes' do
        expect(subject).not_to include(toggle: 'collapse')
      end
    end

    context 'when collapse is nil in options' do
      let(:options) { { collapse: nil } }
      it 'does not merge in collapse data attributes' do
        expect(subject).not_to include(toggle: 'collapse')
      end
    end
  end

  describe 'private methods' do
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
  end
end
