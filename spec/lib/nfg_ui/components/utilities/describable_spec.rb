require 'rails_helper'

RSpec.describe NfgUi::Components::Utilities::Describable do
  let(:tested_component) { FactoryBot.create(:alert, **options) }
  let(:options) { {} }

  describe '#describe' do
    subject { tested_component.describe }
    context 'when describe is present in options' do
      let(:tested_describe) { 'Tested describe' }
      let(:options) { { describe: tested_describe } }
      it { is_expected.to eq tested_describe }
    end

    context 'when describe is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end

    context 'when describe is passed in as nil' do
      let(:options) { { describe: nil } }
      it { is_expected.to be_nil }
    end
  end

  describe '#data' do
    subject { tested_component.data }
    context 'when describe is truthy' do
      let(:tested_describe) { 'tested_describe' }
      let(:options) { { describe: tested_describe } }
      it { is_expected.to include(describe: tested_describe) }
    end

    context 'when describe is falsy' do
      let(:options) { {} }
      it { expect(tested_component.data.keys).not_to include(:describe) }
    end
  end

  describe 'private methods' do
    describe '#non_html_attribute_options' do
      subject { tested_component.send(:non_html_attribute_options) }
      it { is_expected.to include :describe }
    end
  end
end
