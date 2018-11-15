require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::DropdownHeader do
  let(:dropdown_header) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { dropdown_header.component_family }
    it { is_expected.to eq :dropdown }
  end

  describe '#heading' do
    subject { dropdown_header.heading }
    context 'when heading is present' do
      let(:test_heading) { 'tested heading' }
      let(:options) { { heading: test_heading } }
      it { is_expected.to eq test_heading }
    end

    context 'when heading is not present' do
      it { is_expected.to eq '' }
    end
  end
end
