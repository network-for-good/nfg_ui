require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::TileSection do
  let(:tile_section) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Iconable utility module'

  pending 'TileSection specs needed'

  describe '#heading' do
    subject { tile_section.heading }
  end

  describe '#component_family' do
    subject { tile_section.component_family }
    it { is_expected.to eq :tile }
  end
end
