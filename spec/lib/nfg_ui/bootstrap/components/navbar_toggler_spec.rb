require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::NavbarToggler do
  let(:navbar_toggler) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { navbar_toggler.component_family }
    it { is_expected.to eq :navbar }
  end

  describe '#assistive_html_attributes' do
    subject { navbar_toggler.send(:assistive_html_attributes) }

    context 'when collapse is present' do
      let(:collapse_word) { 'test' }
      let(:options) { { collapse: "##{collapse_word}" } }
      it { is_expected.to eq(aria: { controls: collapse_word }, role: 'button') }
    end

    context 'when collapse is not present' do
      let(:options) { {} }
      it { is_expected.to eq({}) }
    end
  end
end
