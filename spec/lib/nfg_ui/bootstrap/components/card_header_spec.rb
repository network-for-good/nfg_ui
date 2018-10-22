require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::CardHeader do
  let(:card_header) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#heading' do
    subject { card_header.heading }
    context 'when heading is present in options' do
      let(:tested_heading) { 'Tested Heading' }
      let(:options) { { heading: tested_heading } }
      it { is_expected.to eq tested_heading }
    end

    context 'when heading is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#component_family' do
    subject { card_header.component_family }
    it { is_expected.to eq :card }
  end

  describe '#non_html_attribute_options' do
    subject { card_header.send(:non_html_attribute_options) }
    it { is_expected.to include :heading }
  end
end
