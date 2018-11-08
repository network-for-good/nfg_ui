require 'rails_helper'

RSpec.describe NfgUi::Components::Utilities::Traitable do
  let(:traitable_component) { NfgUi::Components::Base.new(options.merge(traits: traits), view_context) }
  let(:view_context) { ActionController::Base.new.view_context }
  let(:options) { {} }
  let(:traits) { [] }

  it { expect(described_class.included_modules).to include NfgUi::Components::Traits }

  describe '#traits' do
    subject { traitable_component.traits }
    context 'when traits are present' do
      let(:traits) { [:test] }
      it { is_expected.to eq traits }
    end
  end

  describe 'private methods' do
    describe '#initialize_traits' do

      let(:traitable_component) { view_context.ui.nfg(:alert, *traits) }
      let(:traits) { [:secondary] }
      
      context 'when traits are present' do
      end

      context 'when traits are not present' do
      end
    end
  end 
end
