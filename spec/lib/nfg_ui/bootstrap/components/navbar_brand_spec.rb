require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::NavbarBrand do
  let(:navbar_brand) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { navbar_brand.component_family }
    it { is_expected.to eq :navbar }
  end

  describe '#href' do
    subject { navbar_brand.href }
    context 'when href is true in options' do
      let(:tested_href) { 'tested_href' }
      let(:options) { { href: tested_href } }
      it { is_expected.to eq tested_href }
    end

    context 'when href is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq '#' }
    end
  end
end
