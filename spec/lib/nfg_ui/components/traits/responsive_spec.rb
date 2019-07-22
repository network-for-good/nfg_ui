require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Responsive do
  let(:component_with_traits) { NfgUi::Components::Foundations::Illustration.new(options.merge!(traits: traits), ActionController::Base.new.view_context) }
  let(:options) { {} }
  let(:traits) { [] }

  describe 'registered traits' do
    subject { described_class::TRAITS }
    it { is_expected.to eq [:responsive] }
  end

  describe '#responsive_trait' do
    context 'when :responsive trait is present' do
      let(:traits) { [:responsive] }
      it { expect(component_with_traits.options[:responsive]).to eq true }
    end

    context 'when :responsive trait is not present' do
      let(:traits) { [] }
      it { expect(component_with_traits.options[:responsive]).not_to be }
    end
  end
end
