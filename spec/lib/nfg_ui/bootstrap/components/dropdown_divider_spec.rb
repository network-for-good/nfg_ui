require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::DropdownDivider do
  let(:dropdown_divider) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { dropdown_divider.component_family }
    it { is_expected.to eq :dropdown }
  end
end
