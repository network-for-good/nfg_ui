require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::TileBody do
  let(:tile_body) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  pending 'TileBody specs needed'

  describe '#component_family' do
    subject { tile_body.component_family }
    it { is_expected.to eq :tile }
  end

  describe '#heading' do
    subject { tile_body.heading }
  end
end
