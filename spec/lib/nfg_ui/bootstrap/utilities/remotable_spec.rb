require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Remotable do
  # Button is remotable
  let(:button) { FactoryBot.create(:bootstrap_button, **options) }
  let(:options) { {} }

  describe '#data' do
    subject { button.data }
    context 'when remote is true' do
      context 'and when the component has existing data attributes' do
        let(:tested_data_key) { 'test-key' }
        let(:tested_data_value) { 'test-value' }
        let(:options) { { remote: true, data: { tested_data_key => tested_data_value } } }

        it 'merges the data attributes together' do
          expect(subject).to eq({ tested_data_key => tested_data_value, remote: 'true' })
        end

      end

      context 'and when the component does not have existing data attributes' do
        let(:options) { { remote: true, data: {} } }
        it 'adds the remote data attribute' do
          expect(subject).to include(remote: 'true')
        end
      end
    end

    context 'when remote is false' do
      let(:options) { { remote: false } }
      it 'does not add the remote data attribute' do
        expect(subject).not_to include(remote: 'true')
      end
    end
  end

  describe '#remote' do
    subject { button.remote }
    context 'when :remote is true' do
      let(:options) { { remote: true } }
      it { is_expected.to be }
    end

    context 'when :remote is false' do
      let(:options) { { remote: false } }
      it { is_expected.not_to be }
    end

    context 'when :remote is nil' do
      let(:options) { { remote: nil } }
      it { is_expected.to be_falsy }
    end

    context 'when :remote is not present' do
      let(:options) { {} }
      it { is_expected.to be_falsy }
    end
  end

  describe 'private methods' do
    describe '#non_html_attribute_options' do
      subject { button.send(:non_html_attribute_options) }
      it { is_expected.to include :remote }
    end
  end
end
