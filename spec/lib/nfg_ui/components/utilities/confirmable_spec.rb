require 'rails_helper'

RSpec.describe NfgUi::Components::Utilities::Confirmable do
  let(:tested_component) { FactoryBot.create(:button, **options) }
  let(:options) { {} }

  describe '#confirm' do
    subject { tested_component.confirm }
    context 'when confirm is present in options' do
      let(:tested_confirm) { 'Tested confirm' }
      let(:options) { { confirm: tested_confirm } }
      it { is_expected.to eq tested_confirm }
    end

    context 'when confirm is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end

    context 'when confirm is passed in as nil' do
      let(:options) { { confirm: nil } }
      it { is_expected.to be_nil }
    end
  end

  describe '#data' do
    subject { tested_component.data }
    context 'when confirm is truthy' do
      let(:tested_confirm) { 'tested_confirm' }
      let(:options) { { confirm: tested_confirm } }
      it { is_expected.to include(confirm: tested_confirm) }
    end

    context 'when confirm is falsy' do
      let(:options) { {} }
      it { expect(tested_component.data.keys).not_to include(:confirm) }
    end
  end

  describe 'private methods' do
    confirm '#non_html_attribute_options' do
      subject { tested_component.send(:non_html_attribute_options) }
      it { is_expected.to include :confirm }
    end
  end
end
