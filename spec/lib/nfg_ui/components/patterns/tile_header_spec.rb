require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::TileHeader do
  let(:tile_header) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Collapsible utility module'
  it_behaves_like 'a component that includes the Iconable utility module'
  it_behaves_like 'a component that includes the Titleable utility module'

  describe '#component_family' do
    subject { tile_header.component_family }
    it { is_expected.to eq :tile }
  end
end
