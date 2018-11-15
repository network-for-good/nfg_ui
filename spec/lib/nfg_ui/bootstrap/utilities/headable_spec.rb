require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Headable do
  # Alert is headable
  let(:alert) { FactoryBot.create(:bootstrap_alert, **options) }
  let(:options) { { heading: tested_heading } }
  let(:tested_heading) { nil }

  describe '#heading' do
    subject { alert.heading }
    context 'when :heading is present' do
      let(:tested_heading) { 'Tested Heading' }
      it { is_expected.to eq tested_heading }
    end

    context 'when :heading is not present' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end

    context 'when :heading is nil' do
      let(:tested_heading) { nil }
      it { is_expected.to be_nil }
    end
  end

  describe 'private methods' do
    describe '#non_html_attribute_options' do
      subject { alert.send(:non_html_attribute_options) }
      it { is_expected.to include :heading }
    end
  end
end
