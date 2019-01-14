require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Modalable do
  let(:button) { FactoryBot.create(:button, **options) }
  let(:options) { {} }

  describe '#data' do
    subject { button.data }

    describe 'modal implications on the component data attribute' do
      context 'when :modal is present in options' do
        let(:data_hash) { {} }
        let(:modal) { '#test_modal' }
        let(:options) { { data: data_hash, modal: modal } }

        context 'when data is already present' do
          let(:data_hash) { { test: 'value' } }
          it { is_expected.to eq(**data_hash, toggle: 'modal', target: "#{modal}") }
        end

        context 'when data is not already present' do
          it { is_expected.to eq({ toggle: 'modal', target: "#{modal}" }) }
        end
      end

      context 'when :modal is not present in options' do
        let(:options) { {} }
        it { is_expected.to eq({}) }
      end
    end
  end

  describe '#modal' do
    let(:options) { { modal: tested_modal } }
    let(:tested_modal) { nil }
    subject { button.modal }

    context 'when :modal is present & provided in the options' do
      let(:tested_modal) { '#tested_modal' }
      it { is_expected.to eq tested_modal }
    end

    context 'when :modal is nil in the options' do
      let(:tested_modal) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :modal is not present in the options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#non_html_attribute_options' do
    subject { button.send(:non_html_attribute_options) }
    it { is_expected.to include(:modal) }
  end
end
