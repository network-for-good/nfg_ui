require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::NavLink do
  let(:nav) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { nav.component_family }
    it { is_expected.to eq :nav }
  end

  describe '#dropdown' do
    subject { nav.dropdown }
    context 'when dropdown is true in options' do
      let(:options) { { dropdown: true } }
      it { is_expected.to be }
    end

    context 'when dropdown is nil in options' do
      let(:options) { { dropdown: nil } }
      it { is_expected.to be_nil }
    end

    context 'when dropdown is not present in options' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end
end
