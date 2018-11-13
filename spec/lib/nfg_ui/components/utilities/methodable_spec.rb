require 'rails_helper'

RSpec.describe NfgUi::Components::Utilities::Methodable do
  let(:button) { FactoryBot.create(:button, traits: traits, **options) }
  let(:options) { {} }
  let(:traits) { [] }

  describe '#method' do
    subject { button.send(:method) }
    let(:options) { { method: tested_method } }
    let(:tested_method) { nil }
    context 'when :method is present in the options hash' do
      let(:tested_method) { :delete }
      it { is_expected.to eq tested_method }
    end

    context 'when :method is not present in the options hash' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end

    context 'when :method is nil in the options hash' do
      let(:options) { { method: nil } }
      it { is_expected.to be_falsy }
    end
  end

  describe '#non_html_attribute_options' do
    subject { button.send(:non_html_attribute_options) }
    it { is_expected.to include :method }
  end
end
