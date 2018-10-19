require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Card do
  let(:card) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Themeable utility module'

  describe '#heading' do
    subject { card.heading }
    context 'when heading is supplied in :options' do
      let(:test_heading) { 'test heading' }
      let(:options) { { heading: test_heading } }
      it { is_expected.to eq test_heading }
    end

    context 'when heading is not supplied in options' do
      let(:options) { {} }
      it { is_expected.to eq '' }
    end
  end
end
