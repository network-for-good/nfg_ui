require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::CardImage do
  let(:card_image) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { card_footer.component_family }
    it { is_expected.to eq :card }
  end
end
